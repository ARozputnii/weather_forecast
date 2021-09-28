require 'faraday'
require './lib/app_configurator'

class Weather
  include BaseApp::AppConfigurator

  attr_accessor :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def set_weather
    res = Faraday.get("https://api.openweathermap.org/data/2.5/weather?units=metric&lat=#{latitude}&lon=#{longitude}&appid=#{ secret("weather_api_key")}")
    res.body
  end
end

puts Weather.new(49.4285,32.0621).set_weather