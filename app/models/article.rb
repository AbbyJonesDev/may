class Article < ActiveRecord::Base
  belongs_to :User
  has_many :Comments
  # TODO? - make photo accessible
  # attr_accessible :photo
  has_attached_file :photo, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => ':rails_root/app/assets/images/:style/coffee_cup.jpg'
    # :path => ":rails_root/public/system/:attachment/:style/:filename",
    # :url => "/articles/:id/photo(.:format)" 
  validates :title, 
            presence: true,
            uniqueness: true
  validates :body, 
            presence: true
  validates :user_id,
            presence: true
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  def preview
    words = self.body.split(' ')
    preview = words[0, 24].join(' ') + "..."
    return preview
  end

  
end
