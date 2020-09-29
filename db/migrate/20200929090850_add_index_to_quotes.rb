class AddIndexToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_index(:quotes, :email, unique: true)
  end
end
