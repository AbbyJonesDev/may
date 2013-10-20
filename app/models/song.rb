class Song < ActiveRecord::Base
  has_attached_file :mp3
  has_attached_file :chord_chart

  validates :title,
            presence: true
  validates_attachment_content_type :mp3, :content_type => ['audio/mp3', 'audio/ogg']
  validates_attachment_content_type :chord_chart, :content_type => ['application/pdf']
  
end