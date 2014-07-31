  
  namespace :twilio_tasks do
    task :check_time => :environment do 
      User.sms
    end

    task :say_hello => :environment do 
      puts "HELLO world"
    end
  end 