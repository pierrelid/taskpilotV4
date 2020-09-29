class AddSlugIndexToLandingPages < ActiveRecord::Migration[6.0]
  def change
    add_index(:landing_pages, :slug, unique: true)
  end
end
