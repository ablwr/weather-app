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

  # handler receives the time when job is prepared to run in the 2nd argument
  # handler do |job, time|
  #   puts "Running #{job}, at #{time}"
  # end

  every(30.seconds, 'sms', :thread => true) {
    User.all.each do |user|
      # binding.pry
      if user.time.utc.hour == Time.now.hour && user.time.min == Time.now.utc.min
        user.sms 
        puts "Yep for #{user.name}"
      else
        puts "Nope! for #{user.name}"
      end 
    end 


    
  }
  # every(3.minutes, 'less.frequent.job')
  # every(1.hour, 'hourly.job')

  # every(1.day, 'midnight.job', :at => '00:00')


  # ever day at self.time if perciptation == 1













  def sms
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
    @client.account.messages.create(
    :from => '+19842028806',
    :to => self.phone,
    :body => 'Hey there, dude!'
    )
  end

  def check_all_times
    User.all.each do |user|
      if user.time == Time.now
        user.sms
      end
    end
  end
end


