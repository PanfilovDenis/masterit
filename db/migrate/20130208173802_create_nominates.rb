class CreateNominates < ActiveRecord::Migration
  def change
    create_table :nominates do |t|
      t.string :name

      t.timestamps
    end
  end
end
