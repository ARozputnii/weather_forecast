require_relative "message_sender"

class TelegramResponder
  attr_reader :message, :message_sender

  def initialize(bot, message)
    markup = Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: keyboards)
    @message = message
    @message_sender = MessageSender.new(bot, @message, markup)
    # @user = User.find_or_create_by(uid: message.from.id) # TODO: add connection
  end

  def respond
    case message
    when Telegram::Bot::Types::CallbackQuery
      message_sender.current_weather if message.data.include?("current_weather")
      message_sender.weather_for_tomorrow if message.data.include?("weather_for_tomorrow")
    when Telegram::Bot::Types::Message
      message_sender.make_choice
    else
      p "something error"
    end
  end

  private
  # keyboards in telegram app
  def keyboards
    [
      Telegram::Bot::Types::InlineKeyboardButton.new(
        text:          "Get the current weather forecast",
        callback_data: "current_weather"
      ),
      Telegram::Bot::Types::InlineKeyboardButton.new(
        text:          "Get the weather forecast for tomorrow",
        callback_data: "weather_for_tomorrow"
      ),
    ]
  end
end
