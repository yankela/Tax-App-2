class DropColumnsFromReceipts < ActiveRecord::Migration[5.1]
  def change
    remove_column :receipts, :photo
    remove_column :receipts, :total
    remove_column :receipts, :date
    remove_column :receipts, :store_name
    add_attachment :receipts, :picture
  end
end
