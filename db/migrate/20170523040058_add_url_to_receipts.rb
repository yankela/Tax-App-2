class AddUrlToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :address, :string
  end
end
