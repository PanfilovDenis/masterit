class AddReferenceToParticipantToWork < ActiveRecord::Migration
  def change
    change_table :works do |t|
      t.references :participant
    end
  end
end
