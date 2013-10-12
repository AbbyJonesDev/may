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

  def preview
    words = self.body.split(' ')
    preview = words[0, 24].join(' ') + "..."
    return preview
  end

  
end
