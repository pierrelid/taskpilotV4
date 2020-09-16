class AddSecondsToWaitToListLines < ActiveRecord::Migration[6.0]
  def change
    add_column :list_lines, :seconds_to_wait, :integer, default: 0
  end
end
