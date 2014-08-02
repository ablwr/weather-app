class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # around_filter :user_time_zone, if: :user


  private 
  def user_time_zone(&block)
    Time.use_zone(user.time_zone, &block)
  end 

end
