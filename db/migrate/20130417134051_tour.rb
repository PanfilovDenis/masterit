class Tour < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
