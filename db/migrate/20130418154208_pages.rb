class Pages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :state

      t.timestamps
    end
  end
end
