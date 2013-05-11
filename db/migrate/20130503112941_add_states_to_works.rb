class AddStatesToWorks < ActiveRecord::Migration
  def change
    add_column :works, :plagiat_state, :string
    add_column :works, :estimate_state, :string
  end
end
