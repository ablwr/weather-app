class User < ActiveRecord::Base


	validates_presence_of :name, :email
	validates :phone, :presence => true,
                 		:numericality => true,
                 		:length => { :minimum => 10, :maximum => 15 }

end
