class User < ApplicationRecord
  has_secure_password

  has_many :expense_categories
  has_many :receipts, through: :expense_categories
  
end
