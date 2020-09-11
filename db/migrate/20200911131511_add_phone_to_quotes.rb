class AddPhoneToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :phone, :string
  end
end
