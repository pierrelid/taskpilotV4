class CreateListLines < ActiveRecord::Migration[6.0]
  def change
    create_table :list_lines do |t|

      t.timestamps
    end
  end
end
