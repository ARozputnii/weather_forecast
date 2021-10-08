require_relative "../weather/weather_decorator"
require_relative "buttons"

module Bot
  class MessageSender
    include Buttons
    attr_reader :bot, :from, :text

    def initialize(options)
      @bot = options[:bot]
      @from = options[:from]
      @text = options[:text]
    end

    def send
      bot.api.send_message(
        chat_id:      from.id,
        text:         text,
        reply_markup: keyboard_markup
      )
    end

    private
    def keyboard_markup
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [current_weather_button, tomorrow_weather_button])
    end
  end
end
