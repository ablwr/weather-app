class User < ActiveRecord::Base
  validates_presence_of :name, :email

  include Weather::InstanceMethods

end
