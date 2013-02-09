class CreateCatalogs < ActiveRecord::Migration
  def change
    create_table :catalogs do |t|
      t.integer :tour_id
      t.integer :competition_id

      t.timestamps
    end
  end
end
