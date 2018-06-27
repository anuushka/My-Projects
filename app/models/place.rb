class Place < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :reviews
	mount_uploader :image,ImageUploader
end
