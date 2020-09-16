class AddWaitingStartToListLines < ActiveRecord::Migration[6.0]
  def change
    add_column :list_lines, :waiting_start, :datetime
  end
end
