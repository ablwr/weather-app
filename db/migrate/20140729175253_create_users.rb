class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string       :name
    	t.string       :phone
    	t.string       :email
      t.float        :latitude
      t.float        :longitude
      t.string       :address
      t.datetime     :time

      t.timestamps
    end
  end
end
