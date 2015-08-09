class CreatePodcasts < ActiveRecord::Migration
  def change
    create_table :podcasts do |t|

    	t.string :name
    	t.timestamp :air_date
    	t.integer :created_by
    	t.text :description

      t.timestamps null: false
    end
  end
end
