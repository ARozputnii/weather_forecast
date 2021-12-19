require_relative 'abstract'
require_relative 'settings'
require_relative 'reload_location'
require_relative 'set_time'

module Bot::Buttons
  class ButtonsComposer
    attr_reader :user, :data, :structure

    BUTTONS = {
      settings: Bot::Buttons::Settings,
      reload_location: Bot::Buttons::ReloadLocation,
      set_time: Bot::Buttons::SetTime,
    }.freeze

    def initialize(user:, data:, structure:)
      @user = user
      @data = data&.to_sym
      @structure = structure
    end

    def run_and_generate_markup
      button_class = BUTTONS[data]
      raise "#{data.to_s.camelize} is not defined" unless button_class
      button = button_class.new
      button.execute
      if structure.dig(data) == :execute
        return
      elsif structure.dig(data) == :force_reply
        button.force_reply || return
      end
      generate_markup
    end

    def generate_markup
      return collect_buttons(structure.keys) unless data

      result = structure.dig(data)
      if result.is_a? Array
        collect_buttons(result)
      elsif result.is_a? Hash
        collect_buttons(result.keys)
      end
    end

    private

    def collect_buttons(buttons_names_array)
      buttons_array = buttons_names_array.map { |name| BUTTONS[name].new.markup }.compact
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons_array)
    end
  end
end