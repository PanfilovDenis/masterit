class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :competition
      t.string :title
      t.text :describtion
      t.string :state

      t.timestamps
    end
  end
end
