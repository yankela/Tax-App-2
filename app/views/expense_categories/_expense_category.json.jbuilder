json.extract! expense_category, :id, :user_id, :title, :total, :created_at, :updated_at
json.url expense_category_url(expense_category, format: :json)
