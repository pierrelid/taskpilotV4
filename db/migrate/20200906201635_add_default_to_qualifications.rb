class AddDefaultToQualifications < ActiveRecord::Migration[6.0]
  def change
    add_column :qualifications, :default, :boolean, default: false
  end
end
