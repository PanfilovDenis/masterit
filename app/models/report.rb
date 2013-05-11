class Report < ActiveRecord::Base
  attr_accessible :describtion, :state, :title
  belongs_to :competition
end
