class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs to :product
end
