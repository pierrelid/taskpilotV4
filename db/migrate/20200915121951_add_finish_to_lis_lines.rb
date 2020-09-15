class AddFinishToLisLines < ActiveRecord::Migration[6.0]
  def change
    add_column :list_lines, :finish, :boolean, default: false
  end
end
