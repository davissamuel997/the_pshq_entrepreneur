class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

    	t.integer :user_id
    	t.text :name
    	t.timestamp :post_date
    	t.text :description

      t.timestamps null: false
    end

    add_index :posts, :user_id

    change_column :podcasts, :name, :text
    rename_column :podcasts, :created_by, :user_id
  end
end
