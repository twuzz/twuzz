class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :photo_id,  null: false
      t.boolean :original,  null: false, default: false
      t.string  :mime_type, null: false
      t.integer :size,      null: false
      t.integer :width,     null: false
      t.integer :height,    null: false
    end

    add_index :images, [ :photo_id, :original ]
  end
end
