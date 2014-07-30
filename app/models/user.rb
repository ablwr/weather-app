class User < ActiveRecord::Base
  geocoded_by :address   
  after_validation :geocode          
  validates_presence_of :name, :email
  include Weather::InstanceMethods


end
