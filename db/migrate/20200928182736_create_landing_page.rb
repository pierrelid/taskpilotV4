class CreateLandingPage < ActiveRecord::Migration[6.0]
  def change
    create_table :landing_pages do |t|
      t.references :team, null: false, foreign_key: true
      t.timestamps
    end
  end
end
