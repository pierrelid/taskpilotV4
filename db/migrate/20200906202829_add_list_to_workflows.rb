class AddListToWorkflows < ActiveRecord::Migration[6.0]
  def change
    add_reference :workflows, :list, null: false, foreign_key: true
  end
end
