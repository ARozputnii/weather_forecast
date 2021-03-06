module Weather
  class ApiClient
    include AppConfigurator

    attr_accessor :latitude, :longitude

    def initialize(latitude, longitude)
      @latitude = latitude
      @longitude = longitude
    end

    def set_data
      res = Faraday.get("https://api.openweathermap.org/data/2.5/weather?units=metric&lat=#{latitude}&lon=#{longitude}" +
                          "&appid=#{weather_api_key}")

      JSON.parse(res.body)
    end
  end
end
