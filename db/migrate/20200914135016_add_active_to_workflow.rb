class AddActiveToWorkflow < ActiveRecord::Migration[6.0]
  def change
    add_column :workflows, :active, :boolean, default: false
  end
end
