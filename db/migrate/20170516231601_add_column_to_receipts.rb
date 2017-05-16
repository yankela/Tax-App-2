class AddColumnToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :picture_processing, :boolean
  end
end
