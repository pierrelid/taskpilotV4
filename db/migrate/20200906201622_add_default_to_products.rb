class AddDefaultToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :default, :boolean, default: false
  end
end
