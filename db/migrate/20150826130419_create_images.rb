class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.integer :user_id
    	t.text :name

    	t.integer :imageable_id
    	t.string :imageable_type

      t.timestamps null: false
    end

    add_index :images, :user_id
    add_index :images, :imageable_id
    add_index :images, :imageable_type
  end
end
