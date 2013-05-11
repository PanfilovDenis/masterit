class Image < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  attr_accessible :description, :url, :name, :work_id, :photo

  belongs_to :work
end
