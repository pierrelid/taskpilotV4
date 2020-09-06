class AddQualificationToLists < ActiveRecord::Migration[6.0]
  def change
    add_reference :lists, :qualification, null: false, foreign_key: true
  end
end
