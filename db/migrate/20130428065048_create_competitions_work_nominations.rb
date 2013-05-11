class CreateCompetitionsWorkNominations < ActiveRecord::Migration
  def change
    create_table :competitions_work_nominations, :id => false do |t|
        t.integer :competition_id
        t.integer :work_nomination_id
    end
  end
end
