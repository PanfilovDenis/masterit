class Expert < User
  attr_accessible :basket, :work_nominations, :works, :estimations
  has_many :estimations
  has_many :works, through: :estimations
  has_one :basket
end
