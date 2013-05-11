class Source < ActiveRecord::Base
  mount_uploader :source, SourceUploader

  attr_accessible :description, :url, :name, :work_id, :source

  belongs_to :work
end
