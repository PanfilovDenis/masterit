class CreateRegistrationWorks < ActiveRecord::Migration
  def change
    create_table :registration_works do |t|
      t.string :name
      t.string :nominate
      t.string :picture
      t.text :description
      t.string :city
      t.string :school
      t.string :area
      t.string :name_class
      t.string :url_work
      t.string :email
      t.string :phone
      t.string :supervizor
      t.string :partners

      t.timestamps
    end
  end
end
