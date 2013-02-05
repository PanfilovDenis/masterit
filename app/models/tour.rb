class Tour < ActiveRecord::Base
  attr_accessible :type
  has_many :competition_tours
  has_many :competitions, :through => :competition_tours
end
