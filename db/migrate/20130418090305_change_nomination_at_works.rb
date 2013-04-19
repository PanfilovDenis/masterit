class ChangeNominationAtWorks < ActiveRecord::Migration
  
  def change
    remove_column :works, :nomination
    add_column :works, :work_nomination_id, :integer
  end
  
end
