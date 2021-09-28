require 'telegram/bot'
require './lib/app_configurator'

include BaseApp
p AppConfigurator


config = AppConfigurator.new
token = config.secret("telegram_bot_token")

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    p message.text
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
