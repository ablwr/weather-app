class User < ActiveRecord::Base
	validates_presence_of :name, :email
	validates :phone, :presence => true,
                 		:numericality => true,
                 		:length => { :minimum => 10, :maximum => 15 }

  ForecastIO.configure do |configuration|
    configuration.api_key = '2228ceef0d8a1294ece6fd4935a085bb'
  end

  def current_weather
    lat = 40.7127
    long = -74.0059
    ForecastIO.forecast(lat, long).currently.summary
  end 

end
