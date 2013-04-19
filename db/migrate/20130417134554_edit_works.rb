class EditWorks < ActiveRecord::Migration
  def change
    add_column :works, :region_id, :integer
    add_column :works, :tour_id, :integer   
  end
end
