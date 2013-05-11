class AddRefenceForWorkToBasket < ActiveRecord::Migration
  def change
    change_table :works do |t|
      t.references :basket
    end
  end
end
