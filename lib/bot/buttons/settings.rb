module Bot
  module Buttons
    class Settings < Abstract
      def execute
        p "EXECUTE SETTINGS"
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "Settings",
          callback_data: "settings"
        )
      end

      def force_reply; end

      def response_message
        self.class.name
      end
    end
  end
end
