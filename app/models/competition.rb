class Competition < ActiveRecord::Base
  include UsefullScopes 
  attr_accessible :year, :tour_id, :state_event
  belongs_to :tour
  state_machine :state, initial: :new do
    state :new
    state :activated
    state :deactivated
    event :activate do
      transition any - :activated => :activated
    end 
    event :deactivate do
      transition :activated => :deactivated
    end
  end
  def can_destroy?
    persisted?
  end
  class << self
    def year_min 
      Date.today.year - 90
    end
    def year_max 
      Date.today.year - 10
    end
  end
end

