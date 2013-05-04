class Region < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :state_event
  
  has_many :works
  has_one :moderator
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
  
  def to_s
    name
  end
  
end
