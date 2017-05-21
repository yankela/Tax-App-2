class ExpenseCategory < ApplicationRecord
  belongs_to :user
  has_many :receipts, dependent: :delete_all
  # include AlgoliaSearch

    # algoliasearch do
    #   attribute :title
    # end
  # has_many :receipts, dependent: destroy
end
