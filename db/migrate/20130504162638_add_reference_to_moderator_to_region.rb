class AddReferenceToModeratorToRegion < ActiveRecord::Migration
  def change
    change_table :regions do |t|
      t.references :moderator
    end
  end
end
