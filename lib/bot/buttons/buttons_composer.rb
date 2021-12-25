require_relative "../settings"

module Bot::Buttons
  class ButtonsComposer
    attr_reader :user, :callback, :structure, :markup, :response_message, :chosen_button

    SPECIAL_COMMANDS = {
      execute: Proc.new { |_composer| return },
      force_reply: Proc.new { |composer| return composer.chosen_button.force_reply }
    }.freeze

    def initialize(user:, callback: nil, structure: nil)
      @user = user
      @callback = callback&.to_sym
      @structure = structure || Bot::Settings::STRUCTURE
    end

    def execute_and_generate_markup
      set_chosen_btn
      set_response_msg
      chosen_button.execute

      SPECIAL_COMMANDS[callback]&.call(self)

      generate_markup
    end

    def generate_markup
      unless callback
        @response_message = "Choose option"
        return @markup    = collect_buttons(structure.keys)
      end

      set_response_msg
      result = structure.deep_find(callback)
      @markup = if result.is_a? Array
        collect_buttons(result)
      elsif result.is_a? Hash
        collect_buttons(result.keys)
      end
    end

    private
    def collect_buttons(buttons_names_array)
      buttons_array = buttons_names_array.map { |name| Bot::Settings::AVAILABLE_BUTTONS[name].new.markup }.compact
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons_array)
    end

    def set_chosen_btn
      @chosen_button ||= Bot::Settings::AVAILABLE_BUTTONS[callback].new
    end

    def set_response_msg
      @response_message = chosen_button.response_message
    end

    def execute_chosen_btn
      chosen_button.execute
    end
  end
end
