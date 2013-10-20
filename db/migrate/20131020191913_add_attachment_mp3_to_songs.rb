class AddAttachmentMp3ToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :mp3
      t.attachment :chord_chart
    end
  end

  def self.down
    drop_attached_file :songs, :mp3
    drop_attached_file :songs, :chord_chart
  end
end
