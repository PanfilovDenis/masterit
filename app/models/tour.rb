class Tour < ActiveRecord::Base
  include UsefullScopes
  attr_accessible :name

  def can_destroy?
    persisted?
  end
end
