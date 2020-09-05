class AddProductToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :product, null: false, foreign_key: true
  end
end
