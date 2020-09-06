class CreateSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :steps do |t|
      t.string :type
      t.timestamps
    end
    add_index :steps, [:type]
  end
end
