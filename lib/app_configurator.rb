require "bundler/setup"
require "dotenv"
Dotenv.load("./.env")
Bundler.require

module AppConfigurator
  def setup_database
    Mongoid.load!(File.join("config", "mongoid.yml"), :production)
  end

  def telegram_token
    ENV["TELEGRAM_BOT_TOKEN"]
  end

  def weather_api_key
    ENV["WEATHER_API_KEY"]
  end
end
