class Video < ActiveRecord::Base
  mount_uploader :video, VideoUploader

  attr_accessible :description, :url, :name, :work_id, :video

  belongs_to :work
end
