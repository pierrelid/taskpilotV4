class AddStepToListLines < ActiveRecord::Migration[6.0]
  def change
    add_reference :list_lines, :step, foreign_key: true
  end
end
