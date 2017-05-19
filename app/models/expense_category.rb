class ExpenseCategory < ApplicationRecord
  belongs_to :user
  has_many :receipts
  # has_many :receipts, dependent: destroy
end
