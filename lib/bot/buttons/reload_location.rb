module Bot
  module Buttons
    class ReloadLocation < Abstract
      def execute
        p 'RELOAD LOCATION'
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "Set your current locations",
          callback_data: "reload_location"
        )
      end

      def force_reply;end
    end
  end
end