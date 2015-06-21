class Photo < ActiveRecord::Base
	belongs_to :place
	mount_uploader :picture, PictureUploader

	validates :picture, :presence => true
	validates :caption, :presence => true, :length => { :minimum => 4 }
end
