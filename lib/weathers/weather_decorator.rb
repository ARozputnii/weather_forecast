require_relative 'api_client'

module Weathers
  class WeatherDecorator
    attr_accessor :weather_data

    def initialize(latitude, longitude)
      @weather_data = Weathers::ApiClient.new(latitude, longitude).set_data
    end

    def set_current_weather
      "the weather in #{weather_data["name"]} - #{weather_data['main']['temp']} degrees Celsius"
    end
  end
end