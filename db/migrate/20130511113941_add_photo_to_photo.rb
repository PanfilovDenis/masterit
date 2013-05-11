class AddPhotoToPhoto < ActiveRecord::Migration
  def change
    add_column :images, :photo, :string
  end
end
