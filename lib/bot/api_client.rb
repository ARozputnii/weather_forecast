module Bot
  class ApiClient
    extend AppConfigurator

    class << self
      def start(token = telegram_token)
        Telegram::Bot::Client.run(token) do |bot|
          bot.listen do |msg|
            weather = set_weather_data

            Bot::TelegramResponder.new(bot: bot, message: msg, weather_data: weather).respond
          end
        end

        puts_and_return("TelegramBot is running...")

      rescue Telegram::Bot::Exceptions::ResponseError => e
        puts_and_return(e.message)
      end

      private
      def set_weather_data
        Weather::WeatherDecorator.new(latitude: 49.4285, longitude: 32.0621)
      end

      def puts_and_return(msg)
        puts msg

        msg
      end
    end
  end
end
