class RemoveTotalFromExpenseCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :expense_categories, :total
  end
end
