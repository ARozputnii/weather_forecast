require_relative "../settings"

module Bot::Buttons
  class ButtonsComposer
    attr_reader :user, :data, :structure, :markup, :response_message, :chosen_button

    def initialize(user:, data: nil, structure: nil)
      @user = user
      @data = data&.to_sym
      @structure = structure || Bot::Settings::STRUCTURE
    end

    def run_and_generate_markup
      @chosen_button = Bot::Settings::AVAILABLE_BUTTONS[data].new
      chosen_button.execute
      @response_message = chosen_button.response_message

      if structure.deep_find(data) == :execute
        return
      elsif structure.deep_find(data) == :force_reply
        return @markup = chosen_button.force_reply
      end

      @markup = generate_markup
    end

    def generate_markup
      unless data
        @response_message = "choose option"
        return @markup    = collect_buttons(structure.keys)
      end

      @chosen_button    ||= Bot::Settings::AVAILABLE_BUTTONS[data].new
      @response_message = chosen_button.response_message

      result = structure.deep_find(data)
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
  end
end
