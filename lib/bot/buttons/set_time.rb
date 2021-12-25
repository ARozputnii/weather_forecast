module Bot
  module Buttons
    class SetTime < Base
      def execute
        p "EXECUTE SETTIME"
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "Set time when to notify about weather",
          callback_data: "set_time"
        )
      end

      def response_message
        self.class.name
      end
    end
  end
end
