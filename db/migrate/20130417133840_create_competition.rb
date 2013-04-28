class CreateCompetition < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :year
      t.string :state

      t.timestamps
    end
  end
end
