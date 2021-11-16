require_relative "buttons"
require_relative "../weather/weather_decorator"

module Bot
  class TelegramResponder
    include Buttons
    attr_reader :bot, :message, :weather_decorator

    def initialize(args)
      @bot = args[:bot]
      @message = args[:message]
      @weather_decorator = args[:weather_data]
      # @user = User.find_or_create_by(uid: message.from.id) # TODO: add connection
    end

    def respond
      case message
      when Telegram::Bot::Types::CallbackQuery
        send_message(weather_decorator.set_current_weather) if message.data.include?("current_weather")
        send_message(weather_decorator.weather_for_tomorrow) if message.data.include?("weather_for_tomorrow")
      when Telegram::Bot::Types::Message
        send_message("Make a choice")
      else
        puts "Something error"
      end
    end


    def send_message(msg)
      bot.api.send_message(
        chat_id:      message.from.id,
        text:         msg,
        reply_markup: keyboard_markup
      )
    end
  end
end
