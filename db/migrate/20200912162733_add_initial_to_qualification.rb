class AddInitialToQualification < ActiveRecord::Migration[6.0]
  def change
    add_column :qualifications, :initial, :boolean, default: false
  end
end
