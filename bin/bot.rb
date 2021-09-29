require "telegram/bot"
require "./lib/app_configurator"
require "./lib/weathers/weather_decorator"
require './models/user'

include AppConfigurator
mongo = configure
token = secret("telegram_bot_token")

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    p message.text
    case message.text
    when "/start"
      bot.api.send_message(
        chat_id: message.chat.id,
        text:    "Hi, #{message.from.first_name}, #{Weathers::WeatherDecorator.new(49.4285, 32.0621).set_current_weather}"
      )
    when "/stop"
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    else
      p user = User.find_or_create_by(chat_id: message.chat.id)
    end
  end
end
