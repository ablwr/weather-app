require 'twilio-ruby'
require 'clockwork'
require './config/boot'
require './config/environment'


class User < ActiveRecord::Base
  geocoded_by :address   
  after_validation :geocode          
  validates_presence_of :name, :email
  include Weather::InstanceMethods


  def self.get_users(time_window=10)
    current_time = Time.now 
    time_minus_ten = current_time - 60 * time_window
    User.where("time < ?", current_time).where("time > ?", time_minus_ten)
  end 


  def sms
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.account.messages.create(
    :from => '+19842028806',
    :to => self.phone,
    :body => "Bring an umbrella #{self.name}!"
    )
  end


  def self.text_if_rain(users)
    users.each do |user|
        user.sms if user.hourly_icon == "rain"
      end  
  end 


  def check_all_times
    User.all.each do |user|
      if user.time == Time.now
        user.sms
      end
    end
  end
end




