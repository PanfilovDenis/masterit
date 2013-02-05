class AddStateToCompetition < ActiveRecord::Migration
  def change
    add_column :competitions, :state, :string
  end
end
