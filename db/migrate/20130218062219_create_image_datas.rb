class CreateImageDatas < ActiveRecord::Migration
  def change
    create_table :image_datas do |t|
      t.integer :image_id,     null: false
      t.integer :datastore_id, null: false
    end

    add_index :image_datas, [ :image_id, :datastore_id ], :unique => true
    add_index :image_datas, :datastore_id
  end
end
