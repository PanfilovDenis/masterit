class CreateEstimations < ActiveRecord::Migration
  def up
    create_table :estimations do |t|
      t.integer :content
      t.integer :decoration
      t.integer :technology_usage
      t.references :expert
      t.references :work
      t.timestamps
    end
  end

end
