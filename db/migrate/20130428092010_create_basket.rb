class CreateBasket < ActiveRecord::Migration
  def up
    create_table :baskets do |t|
      t.references :expert
      t.timestamps
    end
  end

end
