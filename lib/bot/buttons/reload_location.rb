module Bot
  module Buttons
    class ReloadLocation < Base
      def execute
        p "EXECUTE RELOAD LOCATION"
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "Set your current locations",
          callback_data: "reload_location"
        )
      end

      def response_message
        self.class.name
      end
    end
  end
end
