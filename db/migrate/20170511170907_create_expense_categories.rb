class CreateExpenseCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :expense_categories do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
