class AddWorkflowToSteps < ActiveRecord::Migration[6.0]
  def change
    add_reference :steps, :workflow, null: false, foreign_key: true
  end
end
