class AddQuoteToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :quote, null: false, foreign_key: true
  end
end
