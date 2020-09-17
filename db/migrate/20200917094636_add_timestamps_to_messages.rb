class AddTimestampsToMessages < ActiveRecord::Migration[6.0]
  def change
    add_timestamps(:messages, null: false)
  end
end
