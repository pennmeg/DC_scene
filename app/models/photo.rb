class Photo < ApplicationRecord
    has_attached_file :image, :styles => lambda { |attachment| { :thumb =>
		    (attachment.instance.title == 'Special' ? "100x100#" : "64x64#") } }
    validates_attachment :image, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"]}
    validates_attachment_size :image, :in => 0.megabytes..1.megabytes
    belongs_to :user
end
