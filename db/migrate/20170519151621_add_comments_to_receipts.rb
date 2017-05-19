class AddCommentsToReceipts < ActiveRecord::Migration[5.1]
  def change
    add_column :receipts, :comments, :text
  end
end
