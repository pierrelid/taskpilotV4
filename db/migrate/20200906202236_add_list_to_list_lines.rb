class AddListToListLines < ActiveRecord::Migration[6.0]
  def change
    add_reference :list_lines, :list, null: false, foreign_key: true
  end
end
