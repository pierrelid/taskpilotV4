class AddProductToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :product, null: false, foreign_key: true
  end
end
