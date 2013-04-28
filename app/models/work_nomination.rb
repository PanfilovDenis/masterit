class WorkNomination < ActiveRecord::Base
  attr_accessible :name, :state_event
  
  has_many :works
  has_and_belongs_to_many :competitions
  #has_many :competition_work_nomination_relations, dependent: :destroy, class_name: ::CompetitionWorkNominationRelations
  
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
