require_relative "../../spec_helper"
require_relative "../../mocks/unit/bot/telegram_responder_mocks"

RSpec.describe(Bot::TelegramResponder) do
  let(:mock_class) do
    Class.new described_class do
      def respond
        case message
        when Telegram::Bot::Types::CallbackQuery
          Mocks::Unit::Bot::TelegramResponderMocks.success if message.data.include?("current_weather")
        when Telegram::Bot::Types::Message
          "Make a choice"
        else
          "Something error"
        end
      end
    end
  end
  let(:bot) do
    telegram_token = Class.new { include AppConfigurator }.new.telegram_token

    Telegram::Bot::Client.new(telegram_token)
  end
  let(:msg) { Mocks::Unit::Bot::TelegramResponderMocks.message }
  let(:weather_data) { Weather::WeatherDecorator.new(latitude: 49.4285, longitude: 32.0621) }
  let(:mock) { Mocks::Unit::Bot::TelegramResponderMocks.success }

  let(:options) { { bot: bot, message: msg, weather_data: weather_data } }

  describe "#respond" do
    describe "when success" do
      describe "when mock_class" do
        it "has return mock data" do
          expect(mock_class.new(options).respond).to(eq(mock))
        end
      end

      describe "when chat not found" do
        let(:msg) { Mocks::Unit::Bot::TelegramResponderMocks.invalid_command }

        it "has return mock data" do
          expect(mock_class.new(options).respond).to(eq("Make a choice"))
        end
      end
    end

    describe "when error" do
      let(:msg) { nil }

      it "has return error code" do
        expect(mock_class.new(options).respond).to(eq("Something error"))
      end
    end
  end
end
