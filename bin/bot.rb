require 'telegram/bot'
require './lib/app_configurator'

config = AppConfigurator.new
token = config.get_token

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
