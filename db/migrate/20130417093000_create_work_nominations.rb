class CreateWorkNominations < ActiveRecord::Migration
  def change
    create_table :work_nominations do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
