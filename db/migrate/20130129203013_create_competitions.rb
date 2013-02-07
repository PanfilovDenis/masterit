class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :year
      t.integer :tour
      t.timestamps
    end
  end
end
