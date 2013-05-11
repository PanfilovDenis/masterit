class CreatePlagiatDetails < ActiveRecord::Migration
  def change
    create_table :plagiat_details do |t|
      t.string :url
      t.text :message
      t.references :work
      t.references :user
      t.timestamps
    end
  end
end
