require 'twilio-ruby'
require 'clockwork'
require './config/boot'
require './config/environment'

class User < ActiveRecord::Base
  geocoded_by :address   
  after_validation :geocode          
  validates_presence_of :name, :email
  include Weather::InstanceMethods
  include Clockwork


  handler do |text|
    puts "Running #{text}"
    text
  end

    every(1.minute, 'sms') {
      users = User.all.select  {|user| user.time.hour == Time.now.hour && user.time.min == Time.now.min} 
      if !users.empty?
        users.each do |user|
          user.sms
        end 
      else 
        puts "nope"
      end 
    }

  def sms
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.account.messages.create(
    :from => '+19842028806',
    :to => self.phone,
    :body => 'Bring an umbrella!'
    )
  end



  def self.check_times
    User.all.each do |user|
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


