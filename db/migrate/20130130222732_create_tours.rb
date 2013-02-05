class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
        t.string :type
    end
  end

end
