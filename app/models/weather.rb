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

    def minutely
      forecast.minutely.data[48]
    end

    def minutely_summary
      forecast.minutely.summary
    end

    def minutely_icon
      forecast.minutely.icon
    end
    
    def hourly
      forecast.hourly.data[48]
    end

    def hourly_summary
      forecast.hourly.summary
    end 

    def hourly_icon
      forecast.hourly.icon
    end

    def daily
      forecast.daily.data[48]
    end

    def daily_summary
      forecast.daily.summary
    end

    def daily_icon
      forecast.daily.icon
    end

  end 

end 