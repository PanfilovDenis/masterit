class Tour < ActiveRecord::Base
  include UsefullScopes
  attr_accessible :name
  has_many :catalogs
  has_many :competitions, :through => :catalogs
  def can_destroy?
    persisted?
  end
end
