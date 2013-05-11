class Tour < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.references :competition
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
