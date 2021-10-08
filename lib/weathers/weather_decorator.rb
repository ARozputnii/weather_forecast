require_relative "api_client"

module Weathers
  class WeatherDecorator
    attr_reader :city, :temperature

    def initialize(latitude, longitude)
      weather_data = Weathers::ApiClient.new(latitude, longitude).set_data
      @city = weather_data["name"]
      @temperature = weather_data["main"]["temp"]
    end

    def set_current_weather
      "The current weather in #{city} is #{temperature} degrees Celsius"
    end

    def weather_for_tomorrow
      "The weather forecast in #{city} for tomorrow, will be #{temperature} degrees Celsius"
    end
  end
end
