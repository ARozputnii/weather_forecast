require_relative "buttons"
require_relative 'buttons_composer'

module Bot
  class TelegramResponder
    include Buttons
    attr_reader :bot, :message, :user

    def initialize(args)
      @bot = args[:bot]
      @message = args[:message]
      @user = args[:user]
      # @user = User.find_or_create_by(uid: message.from.id) # TODO: add connection
    end

    def respond
      case message
      when Telegram::Bot::Types::CallbackQuery
        p message.data
        # send_message(weather_decorator.set_current_weather) if message.data.include?("current_weather")
        # send_message(weather_decorator.weather_for_tomorrow) if message.data.include?("weather_for_tomorrow")
        markup = Bot::ButtonsComposer.new(
          user: user,
          data: message.data,
          structure: {
            button_1: %i[bla1],
            button_2: {
              bla3: %i[bla3 bla4],
              bla4: %i[bla4 bla5],
            }
          }
        ).generate_markup

        # keyboard_markup = markup[:buttons]
        # callback = markup[:callback]


        bot.api.send_message(
          chat_id:      message.from.id,
          text:         markup[:callback],
          reply_markup: markup[:buttons]
        )
      when Telegram::Bot::Types::Message
        markup = Bot::ButtonsComposer.new(
          user: user,
          data: message.data,
          structure: {
            button_1: %i[bla1],
            button_2: {
              bla3: %i[bla3 bla4],
              bla4: %i[bla4 bla5],
            }
          }
        ).generate_markup

        bot.api.send_message(
          chat_id:      message.from.id,
          text:         markup[:callback],
          reply_markup: markup[:buttons]
        )

        # send_message("Make a choice")
      else
        puts "Something error"
      end
    end


    def send_message(msg)
      bot.api.send_message(
        chat_id:      message.from.id,
        text:         msg,
        reply_markup: keyboard_markup
      )
    end
  end
end
