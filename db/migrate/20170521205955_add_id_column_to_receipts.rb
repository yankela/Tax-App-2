class AddIdColumnToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :userid, :string
  end
end
