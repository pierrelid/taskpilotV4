class AddQuoteToListLines < ActiveRecord::Migration[6.0]
  def change
    add_reference :list_lines, :quote, null: false, foreign_key: true
  end
end
