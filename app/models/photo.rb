class Photo < ApplicationRecord
    has_attached_file :image, :styles => lambda { |attachment| { :thumb =>
		    (attachment.instance.title == 'Special' ? "100x100#" : "64x64#") } }
    validates_attachment :image, content_type: {content_type:
      ["image/jpeg", "image/gif", "image/png"]}
    validate :image_dimensions
    has_one :user

    def image_dimensions
      required_width  = 250
      required_height = 250
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      errors.add(:image, "Width must be #{required_width}px") unless dimensions.width == required_width
      errors.add(:image, "Height must be #{required_height}px") unless dimensions.height == required_height
    end
end
