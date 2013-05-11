class RenameRoleToType < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :role, :type
    end
  end
end
