class Photo < ApplicationRecord
    has_attached_file :image, :styles => lambda { |attachment| { :thumb =>
		    (attachment.instance.title == 'Special' ? "100x100#" : "64x64#") } }
    validates_attachment :image, content_type: {content_type:
      ["image/jpeg", "image/gif", "image/png"]}
    has_one :user
end
