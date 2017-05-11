class User < ApplicationRecord
  has_secure_password

  has_many :expense_categories
end
