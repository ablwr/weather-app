  
  namespace :twilio_tasks do

    task :check_time => :environment do 
      User.check_times
    end

  end 