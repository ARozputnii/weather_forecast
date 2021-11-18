require_relative "../../spec_helper"

describe Bot::ApiClient do
  let(:mock_class) do
    Class.new described_class do
      def self.start(token)
        Telegram::Bot::Client.run(token) do |bot|
          # code this not need for test
        end

        puts_and_return("TelegramBot is running...")

      rescue Telegram::Bot::Exceptions::ResponseError => e
        puts_and_return(e.message)
      end
    end
  end

  describe "#start" do
    describe "when success" do
      let(:token) { Class.new { include AppConfigurator }.new.telegram_token }

      it "when correct telegram token" do
        expect(mock_class.start(token)).to(eq("TelegramBot is running..."))
      end
    end

    describe "when error" do
      let(:token) { "incorrect_token" }

      it "when incorrect telegram token" do
        expect(described_class.start(token)).to(eq("Telegram API has returned the error. "+
                                                     '(ok: "false", error_code: "404", description: "Not Found")'))
      end
    end
  end
end
