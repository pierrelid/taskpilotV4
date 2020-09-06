class AddTeamToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :team, null: false, foreign_key: true
  end
end
