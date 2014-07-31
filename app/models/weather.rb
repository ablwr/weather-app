module Weather 
  module InstanceMethods
    ForecastIO.configure do |configuration|
      configuration.api_key = ENV["FORECAST_KEY"]
    end

    def forecast 
      ForecastIO.forecast(self.latitude, self.longitude)
    end 

    def currently
      forecast.currently
    end
    
    def hourly
      forecast.hourly
    end

    def daily
      forecast.daily
    end

    def summary
      summary
    end 

    def icon
      icon
    end

    # def all_data
    #   # data = {temp: forecast.currently.temp,
    #   # apparent_temp: forecast.currently.apparentTemperature,
    #   # cloud_cover: forecast.currently.cloudCover,
    #   # dew_point: forecast.currently.dewPoint,
    #   # humidity: forecast.currently.humidity,
    #   # icon: forecast.currently.icon,
    #   # ozone: forecast.currently.ozone,
    #   # precipitation_intensity: forecast.currently.precipIntensity,
    #   # precipitation_probability: forecast.currently.precipProbability,
    #   # precipitation_type: forecast.currently.precipType,
    #   # pressure: forecast.currently.pressure,
    #   # time: forecast.currently.time,
    #   # wind_bearing: forecast.currently.windBearing,
    #   # wind_speed: forecast.currently.windSpeed,
    #   # sunrise_time: forecast.currently.sunriseTime,
    #   # sunset_time: forecast.currently.sunsetTime
    #   # } 
    #   data
    # end


  end 


end 