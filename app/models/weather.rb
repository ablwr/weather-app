module Weather 
  module InstanceMethods
    ForecastIO.configure do |configuration|
      configuration.api_key = ENV["FORECAST_KEY"]
    end

    def forecast 
      ForecastIO.forecast(self.latitude, self.longitude)
      binding.pry
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
      forecast.daily.data[0]
    end

    def daily_summary
      forecast.daily.summary
    end

    def daily_icon
      forecast.daily.icon
    end

  end 

end 

# "minutely"=>
#   {"summary"=>"Overcast for the hour.",
#    "icon"=>"cloudy",
#    "data"=>
#     [ {"time"=>1407004020,
#       "precipIntensity"=>0.0028,
#       "precipIntensityError"=>0.0011,
#       "precipProbability"=>0.01,
#       "precipType"=>"rain"}
 # "hourly"=>
 #  {"summary"=>"Light rain starting tomorrow morning.",
 #   "icon"=>"rain",
 #   "data"=>
 #    [{"time"=>1407002400,
 #      "summary"=>"Overcast",
 #      "icon"=>"cloudy",
 #      "precipIntensity"=>0.002,
 #      "precipProbability"=>0.02,
 #      "precipType"=>"rain",
 #      "temperature"=>73.37,
 #      "apparentTemperature"=>73.37,
 #      "dewPoint"=>63.54,
 #      "humidity"=>0.71,
 #      "windSpeed"=>5.19,
 #      "windBearing"=>39,
 #      "visibility"=>9.59,
 #      "cloudCover"=>1,
 #      "pressure"=>1019.8,
 #      "ozone"=>304.4}