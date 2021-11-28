module Bot
  module Buttons
    extend self

    def keyboard_markup
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: [current_weather_button, tomorrow_weather_button])
    end

    def current_weather_button
      {
        button: set_button.new(
          text:          "Get the current weather forecast",
          callback_data: "current_weather"
        ),
        callback: ''
      }
    end

    def tomorrow_weather_button
      set_button.new(
        text:          "Get the weather forecast for tomorrow",
        callback_data: "weather_for_tomorrow"
      )
    end

    def button_1
      set_button.new(
        text:          "button_1",
        callback_data: "button_1"
      )
    end

    def button_2
      set_button.new(
        text:          "button_2",
        callback_data: "button_2"
      )
    end

    def bla1
      set_button.new(
        text:          "bla1",
        callback_data: "bla1"
      )
    end

    def bla2
      set_button.new(
        text:          "bla2",
        callback_data: "bla2"
      )
    end

    def bla3
      set_button.new(
        text:          "bla2",
        callback_data: "bla2"
      )
    end

    def bla4(type: :execute)
      set_button.new(
        text:          "bla4",
        callback_data: "bla4"
      )
    end



    private
    def set_button
      Telegram::Bot::Types::InlineKeyboardButton
    end
  end
end
