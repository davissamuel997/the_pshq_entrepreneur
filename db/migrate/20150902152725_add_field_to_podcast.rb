class AddFieldToPodcast < ActiveRecord::Migration
  def change
  	add_column :podcasts, :summary, :text
  end
end
