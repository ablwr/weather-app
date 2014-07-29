class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string   :name
    	t.integer  :phone
    	t.string   :email
      t.float    :latitude
      t.float    :longitude

      t.timestamps
    end
  end
end
