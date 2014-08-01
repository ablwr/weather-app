  task :check_time => :environment do 
      User.check_times
    end

