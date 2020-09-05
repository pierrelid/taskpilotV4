class AddTeamToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :team, null: false, foreign_key: true
  end
end
