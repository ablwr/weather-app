  namespace :twilio_tasks do

    task :check_time => :environment do 
      users = User.get_users
      User.text_if_rain(users)
    end    

    task :send_text => :environment do 
      users = User.all
      User.text_if_rain(users)
    end

  end 

