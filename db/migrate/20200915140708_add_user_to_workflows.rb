class AddUserToWorkflows < ActiveRecord::Migration[6.0]
  def change
    add_reference :workflows, :user, null: false, foreign_key: true
  end
end
