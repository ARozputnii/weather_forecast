module Bot
  class ButtonsComposer
    attr_reader :user, :data, :structure

    def initialize(user:, data:, structure:)
      @user = user
      @data = data
      @structure = structure
    end

    def generate_markup
      return collect_buttons(structure.keys) unless data

      result = structure.dig(data.to_sym)
      buttons = if result.is_a? Array
        collect_buttons(result)
      elsif result.is_a? Hash
        collect_buttons(result.keys)
      end

      callback = Bot::Buttons.send(data)[:callback]
      { buttons: buttons, callback: callback }
    end

    private

    def collect_buttons(buttons_names_array)
      buttons_array = buttons_names_array.map { |name| Bot::Buttons.send(name)[:button] }
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons_array)
    end
  end
end