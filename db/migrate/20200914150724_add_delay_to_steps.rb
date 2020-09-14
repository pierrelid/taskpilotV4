class AddDelayToSteps < ActiveRecord::Migration[6.0]
  def change
    add_column :steps, :delay, :integer, default: 0
  end
end
