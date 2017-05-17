class AddTextColumnToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :text_response, :text
  end
end
