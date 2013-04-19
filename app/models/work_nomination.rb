class WorkNomination < ActiveRecord::Base
  attr_accessible :name, :state_event
  
  has_many :works
  
  validates :name, :presence => true
  
  state_machine :state, initial: :hidden do
    state :hidden
    state :published

    event :publish do
      transition :hidden => :published
    end

    event :hide do
      transition all => :hidden
    end
  end
  
end
