class AddSlugIndexToTeams < ActiveRecord::Migration[6.0]
  def change
    add_index(:teams, :slug, unique: true)
  end
end
