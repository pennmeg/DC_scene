class Photo < ApplicationRecord
  has_attached_file :image,
      styles: {
          large: "500x500#",
          medium: "300x300#",
          thumb: "100x100#"
      },
      convert_options: {
          thumb: "-quality 75 -strip",
          original: "-quality 85 -strip"
      },
      storage: :s3,
      s3_region: ENV["S3_REGION"],
      s3_credentials: {
          bucket: ENV["S3_BUCKET"],
          access_key_id: ENV["AWS_ACCESS_KEY_ID"],
          secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
      },
      default_url: "/images/:style/missing_image.jpg"
    validates_attachment :image, content_type: {content_type: ["image/jpeg", "image/gif", "image/png"]}
    validates_attachment_size :image, :in => 0.megabytes..1.megabytes
    belongs_to :user
end
