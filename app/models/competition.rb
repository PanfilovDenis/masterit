class Competition < ActiveRecord::Base
  attr_accessible :year, :state, :state_event
  has_many :competition_tours
  has_many :tours, :through => :competition_users
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
end

