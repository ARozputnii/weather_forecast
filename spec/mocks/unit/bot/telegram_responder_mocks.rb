module Mocks
  module Unit
    module Bot
      class TelegramResponderMocks
        class << self
          def message
            Telegram::Bot::Types::CallbackQuery.new(
              {
                "id":            "2358329662766648604",
                "from":          {
                  "id":            1,
                  "is_bot":        false,
                  "first_name":    "name",
                  "language_code": "ru"
                },
                "message":       {
                  "message_id":       1,
                  "from":             {
                    "id":         1,
                    "is_bot":     true,
                    "first_name": "telegram_weather",
                    "username":   "weather_rails_bot"
                  },
                  "date":             1637134244,
                  "chat":             {
                    "id":         1,
                    "type":       "private",
                    "first_name": "name"
                  },
                  "text":             "The weather forecast in Cherkasy for tomorrow, will be 0.89 degrees Celsius",
                  "entities":         [],
                  "caption_entities": [],
                  "photo":            [],
                  "new_chat_members": [],
                  "new_chat_photo":   [],
                  "reply_markup":     {
                    "inline_keyboard": [
                      [
                        {
                          "text":          "Get the current weather forecast",
                          "callback_data": "current_weather"
                        }
                      ],
                      [
                        {
                          "text":          "Get the weather forecast for tomorrow",
                          "callback_data": "weather_for_tomorrow"
                        }
                      ]
                    ]
                  }
                },
                "chat_instance": "6318349983072070546",
                "data":          "current_weather"
              }
            )
          end

          def send_message
            {
              "text":         "The current weather in Cherkasy is 1.99 degrees Celsius",
              "reply_markup": {
                "inline_keyboard": [
                  [
                    {
                      "text":          "Get the current weather forecast",
                      "callback_data": "current_weather"
                    }
                  ],
                  [
                    {
                      "text":          "Get the weather forecast for tomorrow",
                      "callback_data": "weather_for_tomorrow"
                    }
                  ]
                ]
              }
            }
          end

          def success
            {
              "ok":     true,
              "result": {
                "message_id":   1,
                "from":         {
                  "id":         1,
                  "is_bot":     true,
                  "first_name": "telegram_weather",
                  "username":   "weather_rails_bot"
                },
                "chat":         {
                  "id":         1,
                  "first_name": "somename",
                  "type":       "private"
                },
                "date":         Date.today,
                "text":         "The current weather in somecity is 1 degrees Celsius",
                "reply_markup": {
                  "inline_keyboard": [
                    [
                      {
                        "text":          "Get the current weather forecast",
                        "callback_data": "current_weather"
                      }
                    ],
                    [
                      {
                        "text":          "Get the weather forecast for tomorrow",
                        "callback_data": "weather_for_tomorrow"
                      }
                    ]
                  ]
                }
              }
            }
          end

          def invalid_command
            Telegram::Bot::Types::Message.new(
              {
                "message_id":       1,
                "from":             {
                  "id":            1,
                  "is_bot":        false,
                  "first_name":    "name",
                  "language_code": "ru"
                },
                "date":             1637144103,
                "chat":             {
                  "id":         1,
                  "type":       "private",
                  "first_name": "name"
                },
                "text":             "1",
                "entities":         [],
                "caption_entities": [],
                "photo":            [],
                "new_chat_members": [],
                "new_chat_photo":   []
              }
            )
          end
        end
      end
    end
  end
end
