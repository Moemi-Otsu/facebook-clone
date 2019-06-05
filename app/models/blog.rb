class Blog < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: {in: 1..300}
end
