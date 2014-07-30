# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :check_time => :environment do 

    User.sms
  end

  task :say_hello => :environment do 
    puts "HELLO world"
  end