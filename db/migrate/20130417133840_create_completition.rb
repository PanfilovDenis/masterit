class CreateCompletition < ActiveRecord::Migration
  def change
    create_table :completitions do |t|
      t.string :name
      t.integer :tour_id
      t.integer :year
      t.string :state

      t.timestamps
    end
  end
end
