json.extract! receipt, :id, :expense_category_id, :photo, :total, :date, :store_name, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
