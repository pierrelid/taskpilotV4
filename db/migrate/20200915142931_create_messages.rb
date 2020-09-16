class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :type
      t.string :title
      t.string :body
    end
  end
end
