module Bot
  module Buttons
    def current_weather_button
      set_button.new(
        text:          "Get the current weather forecast",
        callback_data: "current_weather"
      )
    end

    def tomorrow_weather_button
      set_button.new(
        text:          "Get the weather forecast for tomorrow",
        callback_data: "weather_for_tomorrow"
      )
    end

    private
    def set_button
      @set_button = Telegram::Bot::Types::InlineKeyboardButton
    end
  end
end
