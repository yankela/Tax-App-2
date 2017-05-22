module WickedPdfHelper
  def wicked_pdf_stylesheet_link_tag(*sources)
     sources.collect { |source|
       p source
       asset = (Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)).find_asset("#{source}.css")
       p asset

       if asset.nil?
         raise "could not find asset for #{source}.css"
       else
         "<style type='text/css'>#{asset.body}</style>"
       end
     }.join("\n").gsub(/url\(['"](.+)['"]\)(.+)/,%[url("#{wicked_pdf_image_location("\\1")}")\\2]).html_safe
   end
end
