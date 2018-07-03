class Place < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :categories 
	mount_uploader :image,ImageUploader
	belongs_to :user

	
	def self.search(search)
		if search
			 where(["title LIKE ?", "%#{search}%"])
		else
			order("updated_at DESC")
		end
	end  
end


