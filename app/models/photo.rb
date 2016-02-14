class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :album, :dependent => :destroy
  
  validates :album, :presence => true
	# Photo uploader using carrierwave
  mount_uploader :image, PhotoUploader
end
