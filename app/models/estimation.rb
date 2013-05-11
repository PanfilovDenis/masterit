class Estimation < ActiveRecord::Base
  after_initialize :default_values
  attr_accessible :content, :decoration, :technology_usage
  validates :content, inclusion: 0..10
  validates :decoration, inclusion: 0..10
  validates :technology_usage, inclusion: 0..10
  belongs_to :work
  belongs_to :expert
  private
    def default_values
      self.content = 1 unless self.content
      self.decoration = 1 unless self.decoration
      self.technology_usage = 1 unless self.technology_usage
    end
end
