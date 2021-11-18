require_relative "../../lib/app_configurator"

describe AppConfigurator do
  let(:some_class) { Class.new { include AppConfigurator } }

  describe "#telegram_token" do
    it "correct telegram token" do
      expect(some_class.new.telegram_token).not_to(eql(""))
    end
  end

  describe "#weather_api_key" do
    it "correct weather api key" do
      expect(some_class.new.weather_api_key).not_to(eql(""))
    end
  end
end
