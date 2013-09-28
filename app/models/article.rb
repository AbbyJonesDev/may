class Article < ActiveRecord::Base
  belongs_to :User
  has_many :Comments
  #TODO - make photo accessible
  # attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
# From Paperclip install warning.  Necessary???
#   Paperclip 3.0 introduces a non-backward compatible change in your attachment
# path. This will help to prevent attachment name clashes when you have
# multiple attachments with the same name. If you didn't alter your
# attachment's path and are using Paperclip's default, you'll have to add
# `:path` and `:url` to your `has_attached_file` definition. For example:

#     has_attached_file :avatar,
#       :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
#       :url => "/system/:attachment/:id/:style/:filename"
end