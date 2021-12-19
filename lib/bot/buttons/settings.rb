module Bot
  module Buttons
    class Settings < Abstract
      def execute
        p 'SETTINGS'
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "Settings",
          callback_data: "settings"
        )
      end

      def force_reply;end
    end
  end
end