class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "first_name", :limit => 50
    	t.string "last_name", :limit => 50
    	t.string "username", :limit => 50
    	t.string "password_digest"
    	t.string "email", :limit => 150
      t.integer "user_type_id"
      t.timestamps null: false
    end
  end
end
