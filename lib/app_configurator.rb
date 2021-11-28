require "bundler/setup"
Bundler.require
Dotenv.load("./.env")
require_relative "bot/telegram_responder.rb"
require_relative "../models/user.rb"

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
