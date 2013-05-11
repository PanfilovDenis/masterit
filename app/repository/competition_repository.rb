module CompetitionRepository
  extend ActiveSupport::Concern
  include BaseRepository

  included do
    scope :started, where(state: :started)
    scope :current, where(year: Time.current.year)
  end
end
