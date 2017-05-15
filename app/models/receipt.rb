class Receipt < ApplicationRecord
  belongs_to :expense_category
  belongs_to :user 
end
