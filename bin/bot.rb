require "telegram/bot"

require_relative "../lib/app_configurator"
require_relative "../lib/bot/telegram_responder"
require_relative "../models/user"

include AppConfigurator # TODO: need to get refactored
# mongo = configure # TODO: need to get refactored
token = secret("telegram_bot_token") # TODO: need to get refactored

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    Bot::TelegramResponder.new(bot, message).respond
  end
end
