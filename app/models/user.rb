require 'twilio-ruby'
class User < ActiveRecord::Base
  geocoded_by :address   
  after_validation :geocode          
  validates_presence_of :name, :email
  include Weather::InstanceMethods



  def sms
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])

    @client.account.messages.create(
    :from => '+19842028806',
    :to => '+19198105957',
    :body => 'Hey there, girl!'
    )
  end

end
