class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string 'name', :limit => 50
      t.timestamps null: false
    end
  end
end
