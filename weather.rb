require "faraday"

class Weather
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def set_weather
    res = Faraday.get("https://api.openweathermap.org/data/2.5/weather?units=metric&lat=#{@latitude}&lon=#{@longitude}&appid=#{"f1813eae6da664e0665081762add743a"}")
    res.body
  end
end

puts Weather.new(49.4285,32.0621).set_weather