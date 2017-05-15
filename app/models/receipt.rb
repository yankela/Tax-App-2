class Receipt < ApplicationRecord
  belongs_to :expense_category
  belongs_to :user

  validates :picture,
  attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  attachment_size: { less_than: 5.megabytes }

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    medium: '300x300>',
    large: '600x800>'
  }
end
