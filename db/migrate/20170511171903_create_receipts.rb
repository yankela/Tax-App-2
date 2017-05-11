class CreateReceipts < ActiveRecord::Migration[5.1]
  def change
    create_table :receipts do |t|
      t.belongs_to :expense_category, foreign_key: true
      t.string :photo
      t.integer :total
      t.string :date
      t.string :store_name

      t.timestamps
    end
  end
end
