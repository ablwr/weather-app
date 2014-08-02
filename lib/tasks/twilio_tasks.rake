  
  namespace :twilio_tasks do

    task :check_time => :environment do 
      users = User.get_users
      User.check_times(users)
    end

  end 