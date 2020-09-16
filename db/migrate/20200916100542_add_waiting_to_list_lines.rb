class AddWaitingToListLines < ActiveRecord::Migration[6.0]
  def change
    add_column :list_lines, :waiting, :boolean, default: false
  end
end
