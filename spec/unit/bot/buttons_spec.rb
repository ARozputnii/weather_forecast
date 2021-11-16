require_relative "../../spec_helper"

describe Bot::Buttons do
  let(:some_class) { Class.new { include Bot::Buttons } }
  let(:expected_class) { Telegram::Bot::Types::InlineKeyboardButton }

  describe "#current_weather_button" do
    it "when success" do
      expect(some_class.new.current_weather_button.class).to(eql(expected_class))
    end
  end

  describe "#tomorrow_weather_button" do
    it "when success" do
      expect(some_class.new.tomorrow_weather_button.class).to(eql(expected_class))
    end
  end
end
