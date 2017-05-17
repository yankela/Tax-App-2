class OcrTextJob < ApplicationJob
  self.queue_adapter = :resque
  queue_as :ocr

  def perform(id, image_path)

    require "google/cloud/vision"

    vision = Google::Cloud::Vision.new(keyfile: JSON.parse(ENV.fetch('keyfile')), project: ENV.fetch("project_id"))
    image  = vision.image image_path
    p image.text
    receipt = Receipt.find(id)
    receipt.text_response = image.text
    receipt.save
    # [END vision_text_detection_gcs]
  end



end
