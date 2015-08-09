class AddAttachmentRecordingToPodcasts < ActiveRecord::Migration
  def self.up
    change_table :podcasts do |t|
      t.attachment :recording
    end

    add_index :podcasts, :created_by

  end

  def self.down
    remove_attachment :podcasts, :recording
  end
end
