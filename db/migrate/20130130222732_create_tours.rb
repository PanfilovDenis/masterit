class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
    end
  end

end
