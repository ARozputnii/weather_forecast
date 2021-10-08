require_relative "../weathers/weather_decorator"

class MessageSender
  attr_reader :bot, :message, :markup

  def initialize(bot, message, markup)
    @bot = bot
    @message = message
    @markup = markup
  end

  def current_weather
    bot.api.send_message(
      chat_id:      message.from.id,
      text:         Weathers::WeatherDecorator.new(49.4285, 32.0621).set_current_weather,
      reply_markup: markup
    )
  end

  def weather_for_tomorrow
    bot.api.send_message(
      chat_id:      message.from.id,
      text:         Weathers::WeatherDecorator.new(49.4285, 32.0621).weather_for_tomorrow,
      reply_markup: markup
    )
  end

  def make_choice
    bot.api.send_message(chat_id:      message.chat.id,
                         text:         "Make a choice",
                         reply_markup: markup
    )
  end
end
