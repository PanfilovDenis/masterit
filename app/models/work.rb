class Work < ActiveRecord::Base
  attr_accessible :description, :image, :estimations, :name, :state_event, :work_nomination, :user_id, :tour_id, :region_id, :work_nomination_id

  belongs_to :user
  has_many :sources, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  has_many :images, :dependent => :destroy
  has_many :estimations
  has_many :experts, through: :estimations
  has_many :plagiat_details
  has_many :users, through: :plagiat_details

  belongs_to :tour
  belongs_to :region
  belongs_to :work_nomination

  accepts_nested_attributes_for :sources, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :videos, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :images, :reject_if => :all_blank, :allow_destroy => true

  state_machine :plagiat_state, initial: :passing, namespace: :plagiat_state do
    state :passing
    state :banned
    event :ban do
      transition all => :banned
    end
    event :originality_confirm do
      transition all => :passing
    end
  end
  state_machine :estimate_state, initial: :on_estimating, namespace: :estimate_state do
    state :estimated
    state :on_estimating
    event :estimate do
      transition :on_estimating => :estimated
    end
    event :prepare do
      transition :estimated => :on_estimating
    end
  end
  def to_s
    name
  end
end
