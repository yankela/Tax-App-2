class ExpenseCategory < ApplicationRecord
  belongs_to :user
  has_many :receipts, dependent: :delete_all


  # has_many :receipts, dependent: destroy
end
