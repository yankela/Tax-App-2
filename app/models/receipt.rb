class Receipt < ApplicationRecord
include AlgoliaSearch
  belongs_to :expense_category#, touch: true


      algoliasearch auto_index: false, auto_remove: false do
      attribute :store_name, :text_response, :comments, :created_at, :total, :store_name, :address, :userid
      attributesForFaceting [:userid]
    end


  validates :picture,
  attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
  attachment_size: { less_than: 5.megabytes }

  has_attached_file :picture, styles: {
    original: {convert_options: '-auto-orient'},
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
