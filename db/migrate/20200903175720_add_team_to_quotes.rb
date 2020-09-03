class AddTeamToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :team, null: false, foreign_key: true
  end
end
