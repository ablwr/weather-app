class User < ActiveRecord::Base
	validates_presence_of :name, :email
	# validates :phone, :presence => true,
 #                 		:numericality => true,
 #                 		:length => { :minimum => 10, :maximum => 15 }

  ForecastIO.configure do |configuration|
    configuration.api_key = ENV["FORECAST_KEY"]
  end

  def forecast 
    @lat = self.latitude
    @long = self.longitude
    ForecastIO.forecast(@lat, @long)
  end 

  def current_summary
    forecast.currently.summary
  end 

  def current_temp
    forecast.currently.temperature
  end 

  def summary
      forecast.currently.summary
    end 

    def temp
      forecast.currently.temperature
    end  

    def apparent_temperature
      forecast.currently.apparentTemperature
    end 

    def cloud_coverage
      forecast.currently.cloudCover
    end 

    def dew_point
      forecast.currently.dewPoint
    end 

    def humidity
      forecast.currently.humidity
    end 

    def icon
      forecast.currently.icon
    end 

    def ozone
      forecast.currently.ozone
    end 

    def precipitation_intensity
      forecast.currently.precipIntensity
    end 

    def precipitation_probability
      forecast.currently.precipProbability
    end 

    def precipitation_type
      forecast.currently.precipType
    end 

    def pressure
      forecast.currently.pressure
    end 

    def current_time
      forecast.currently.time
    end 

    def wind_bearing
      forecast.currently.windBearing
    end 

    def wind_speed
      forecast.currently.windSpeed
    end 

    def sunrise_time
      forecast.currently.sunriseTime
    end 

    def sunset_time
      forecast.currently.sunsetTime
    end 

    def all_data
      data = {temp: forecast.currently.temp,
      apparent_temp: forecast.currently.apparentTemperature,
      cloud_cover: forecast.currently.cloudCover,
      dew_point: forecast.currently.dewPoint,
      humidity: forecast.currently.humidity,
      icon: forecast.currently.icon,
      ozone: forecast.currently.ozone,
      precipitation_intensity: forecast.currently.precipIntensity,
      precipitation_probability: forecast.currently.precipProbability,
      precipitation_type: forecast.currently.precipType,
      pressure: forecast.currently.pressure,
      time: forecast.currently.time,
      wind_bearing: forecast.currently.windBearing,
      wind_speed: forecast.currently.windSpeed,
      sunrise_time: forecast.currently.sunriseTime,
      sunset_time: forecast.currently.sunsetTime
    } 
      data
    end

end
