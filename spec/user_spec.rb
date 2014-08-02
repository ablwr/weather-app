require 'rails_helper'

describe "User" do 

  before(:each) do 
    current_time = Time.now
    @user1 = User.create(name: "user1", time: current_time, email: "someone@gmail.com")
    @user2 = User.create(name: "user2", time: current_time - 60 * 2, email: "someone@gmail.com")
    @user3 = User.create(name: "user3", time: current_time + 60 * 2, email: "someone@gmail.com")
  end 

  describe '::get_users' do 

    it "should return corrent users" do 
      users = User.get_users(10)
      users.should include(@user1)
      users.should include(@user2)
      users.should_not include(@user3)
    end 

  end 

end 