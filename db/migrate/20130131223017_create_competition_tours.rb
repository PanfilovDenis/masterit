class CreateCompetitionTours < ActiveRecord::Migration
  def change
    create_table :competition_tours do |t|
      t.integer :competition_id
      t.integer :tour_id
    end
  end
end
