class AddSourceToSource < ActiveRecord::Migration
  def change
    add_column :sources, :source, :string
  end
end
