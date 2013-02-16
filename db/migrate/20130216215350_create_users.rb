class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,           :null => false
      t.string :password_digest, :null => false, :limit => 60
      t.string :first_name
      t.string :last_name
    end

    add_index :users, :email, :unique => true
  end
end
