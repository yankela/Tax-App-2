class Receipt < ApplicationRecord
  belongs_to :expense_category#, touch: true
  # include AlgoliaSearch
  #
  #   algoliasearch do
  #     attribute :text_response, :created_at, :total, :comments
  #   end

  validates :picture,
  attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  attachment_size: { less_than: 5.megabytes }

  has_attached_file :picture, styles: {
    thumb: '100x100>',
    medium: '300x300>',
    large: '600x800>'
  }

  process_in_background :picture, processing_image_url: :processing_image_fallback, queue: "paperclip"

 def processing_image_fallback
   options = picture.options
   options[:interpolator].interpolate(options[:url], picture, :original)
 end
end
