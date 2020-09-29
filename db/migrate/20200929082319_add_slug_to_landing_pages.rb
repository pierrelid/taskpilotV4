class AddSlugToLandingPages < ActiveRecord::Migration[6.0]
  def change
    add_column :landing_pages, :slug, :string
  end
end
