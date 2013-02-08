class Catalog < ActiveRecord::Base
  attr_accessible :competition_id, :tour_id
  belongs_to :competition
  belongs_to :tour
end
