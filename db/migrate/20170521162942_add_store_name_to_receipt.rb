class AddStoreNameToReceipt < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :store_name, :text
  end
end
