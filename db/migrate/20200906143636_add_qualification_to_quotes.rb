class AddQualificationToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :quotes, :qualification, null: false, foreign_key: true
  end
end
