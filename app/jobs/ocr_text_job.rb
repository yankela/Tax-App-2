class OcrTextJob < ApplicationJob
  self.queue_adapter = :resque
  queue_as :ocr

  def perform(id, image_path)

    require "google/cloud/vision"

    def first_run(array)
      numero_uno = array.split(" ").select {|num| num.include?("$")}.join(" ").split("$").map {|n| n.to_f}
      return repeat_counter(numero_uno)
    end


    def second_run(array)
      numero_dos = array.split("\n").select {|num| num=~/\$(?<dollars>\d+)\.(?<cents>\d+)/}.join(" ").split(" ").select {|num| num=~/\p{Nd}/}.join(" ").split("$").join(" ").split(" ").map {|n| n.to_f}
      return repeat_counter(numero_dos)
    end

    def third_run(array)
      begin
        /\$(?<dollars>\d+)\.(?<cents>\d+)/.match(array.split("\n").select {|num| num.include?("$")}.last).string.split("$").last.to_f
      rescue StandardError => e

        return
      end
    end

    def fifth_run(array)
      numero_cinco = array.split("\n").select {|num| num.include?(".")}.select {|string| string=~/\A-?(?:\d+(?:\.\d*)?|\.\d+)\z/}.map {|n| n.to_f}
      return repeat_counter(numero_cinco)


    end


    def sixth_run(array)
      numero_seis= array.split(' ').select {|num| num=~/^\$?\-?([1-9]{1}[0-9]{0,2}(\,\d{3})*(\.\d{0,2})?|[1-9]{1}\d{0,}(\.\d{0,2})?|0(\.\d{0,2})?|(\.\d{1,2}))$|^\-?\$?([1-9]{1}\d{0,2}(\,\d{3})*(\.\d{0,2})?|[1-9]{1}\d{0,}(\.\d{0,2})?|0(\.\d{0,2})?|(\.\d{1,2}))$|^\(\$?([1-9]{1}\d{0,2}(\,\d{3})*(\.\d{0,2})?|[1-9]{1}\d{0,}(\.\d{0,2})?|0(\.\d{0,2})?|(\.\d{1,2}))\)$/}.join(" ").split("$").join(" ").split(" ").select {|n| n.include?(".")}.map {|n| n.to_f}
      return repeat_counter(numero_seis)
    end
    # print ("Result is.. "), first.max_by {

    def fourth_run(array)
      numero_cuatro = array.split(" ").select {|num| num.include?(".")}.join(" ").split("$").map {|n| n.to_f}
      return repeat_counter(numero_cuatro)
    end

    def seventh_run(array)
      numero_siete=array.split(' ').select {|n| n=~/^[+-]?[0-9]{1,3}(?:,?[0-9]{3})*(?:\.[0-9]{2})?$/}.select {|n| n.include?(".")}.map {|n| n.to_f}
      return repeat_counter(numero_siete)
    end

    def eigth_run(array)
      numero_ocho= array.delete(" ").split("\n").select {|n| n.include?(".")}.select {|n| n.length <7}.delete_if {|n| n=~/\p{L}/}.map {|n| n.to_f}
      return repeat_counter(numero_ocho)
    end
    def ninth_run(array)
      numero_nueve= array.delete(" ").split("\n").delete_if {|n| n=~/\p{L}/}.select {|n| n.length <7}.map {|n| n.to_f}
      return repeat_counter(numero_nueve)
    end


    def repeat_counter(x)
      if x.count < 2
        return x.max
      else
        freq = x.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        freq.select {|key, value| value == freq.values.max}.keys.max
        # x.max_by { |v| freq[v] }
      end
    end

    def easy_check(x)
      total_array= []
      check = x.split("\n").select { |n| n.include?("TOTAL")}.join(" ").split(" ").select {|n| n.include?(".")}.count
      if check > 1
        return total_array << x.split("\n").select { |n| n.include?("TOTAL")}.join(" ").split(" ").select {|n| n.include?(".")}.join(" ").split(" ").join(" ").split("$").join("").split(" ").map {|n| n.to_f}.max
      else
        total_array << first_run(x)
        total_array << second_run(x)
        total_array << third_run(x)
        total_array << fourth_run(x)
        total_array << fifth_run(x)
        total_array << sixth_run(x)
        total_array << seventh_run(x)
        total_array << eigth_run(x)
        total_array << ninth_run(x)
      end
    end


    vision = Google::Cloud::Vision.new(keyfile: JSON.parse(ENV.fetch('keyfile')), project: ENV.fetch("project_id"))
    image  = vision.image image_path
    p image.text
    receipt = Receipt.find(id)
    receipt.text_response = image.document
    receipt.total = repeat_counter(easy_check(receipt.text_response).select {|n| !n.nil?})
    receipt.address = receipt.picture.url   
    receipt.save
    Receipt.reindex!

    # [END vision_text_detection_gcs]
  end



end
