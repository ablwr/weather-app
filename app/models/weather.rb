module Weather 
  module InstanceMethods
    ForecastIO.configure do |configuration|
      configuration.api_key = ENV["FORECAST_API_KEY"]
    end

    def forecast 
      ForecastIO.forecast(self.latitude, self.longitude)
    end 

    def current_summary
      forecast.currently.summary
    end 

    def current_temp
      forecast.currently.temperature
    end 
  end 


end 