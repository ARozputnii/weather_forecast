require_relative "message_sender"

module Bot
  class TelegramResponder
    attr_reader :bot, :message, :weather_decorator

    def initialize(bot, message)
      @bot = bot
      @message = message
      @weather_decorator = Weather::WeatherDecorator.new(latitude: 49.4285, longitude: 32.0621)
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
        p "Something error"
      end
    end

    private
    def send_message(msg)
      MessageSender.new(bot: bot, from: message.from, text: msg).send
    end
  end
end
