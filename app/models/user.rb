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
      data = [forecast.currently.temp,
      forecast.currently.apparentTemperature,
      forecast.currently.cloudCover,
      forecast.currently.dewPoint,
      forecast.currently.humidity,
      forecast.currently.icon,
      forecast.currently.ozone,
      forecast.currently.precipIntensity,
      forecast.currently.precipProbability,
      forecast.currently.precipType,
      forecast.currently.pressure,
      forecast.currently.time,
      forecast.currently.windBearing,
      forecast.currently.windSpeed,
      forecast.currently.sunsetTime]
      data
    end

end
