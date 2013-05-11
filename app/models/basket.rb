class Basket < ActiveRecord::Base
  has_many :works
  belongs_to :expert
end
