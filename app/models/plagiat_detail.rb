class PlagiatDetail < ActiveRecord::Base
  attr_accessible :message, :url, :work, :work_id, :user
  belongs_to :user
  belongs_to :work
end
