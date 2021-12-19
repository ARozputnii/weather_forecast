module Bot
  module Buttons
    class SetTime < Abstract
      def execute
        p "SET TIME"
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "Set time when to notify about weather",
          callback_data: "set_time"
        )
      end

      def force_reply
        Telegram::Bot::Types::ForceReply.new(
          force_reply: true,
          selective:   true
        )
      end

      def response_message
        self.class.name
      end
    end
  end
end
