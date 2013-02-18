class CreateDatastores < ActiveRecord::Migration
  def change
    create_table :datastores do |t|
      t.string  :type,    null: false
      t.integer :user_id, null: false
      t.text    :settings
    end

    add_index :datastores, :user_id
  end
end
