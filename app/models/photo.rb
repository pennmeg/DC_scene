class Photo < ApplicationRecord
  belongs_to :user
  has_attached_file :image,
      :styles => lambda { |attachment| { :thumb =>
		    (attachment.instance.title == 'Special' ? "100x100#" : "64x64#")
         }
       },
       endstorage: :s3,
       s3_region: S3_REGION,
       s3_credentials: {
           bucket: S3_BUCKET,
           access_key_id: AWS_ACCESS_KEY_ID,
           secret_access_key: AWS_SECRET_ACCESS_KEY
       }
       default_url: "/images/:style/missing_image.jpg"

    validates_attachment :image, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"]}
    validates_attachment_size :image, :in => 0.megabytes..1.megabytes


end
