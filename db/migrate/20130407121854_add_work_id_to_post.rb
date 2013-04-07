class AddWorkIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :work_id, :integer
  end
end
