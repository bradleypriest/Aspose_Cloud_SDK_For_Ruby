module Aspose
  module Cloud
    module Barcode
      class Builder
        def save(code_text, symbology='QR', image_format='png', remote_folder='', storage_type='Aspose', storage_name='', x_resolution=nil, y_resolution=nil, x_dimension=nil, y_dimension=nil)

          raise 'code_text can not be empty.' if code_text.empty?
          raise 'symbology can not be empty.' if symbology.empty?
          raise 'image_format can not be empty.' if image_format.empty?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/barcode/generate?"
          str_uri = "#{str_uri}text=#{code_text}&type=#{symbology}&format=#{image_format}"
          str_uri = "#{str_uri}&resolutionX=#{x_resolution}" unless x_resolution.nil?
          str_uri = "#{str_uri}&resolutionY=#{y_resolution}" unless y_resolution.nil?
          str_uri = "#{str_uri}&dimensionX=#{x_dimension}" unless x_dimension.nil?
          str_uri = "#{str_uri}&dimensionY=#{y_dimension}" unless y_dimension.nil?
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,remote_folder,storage_name,storage_type)

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_uri, :accept => 'application/json')
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}barcode#{symbology}.#{image_format}"
          Aspose::Cloud::Common::Utils.save_file(response, output_path)
          output_path
        end
      end
    end
  end
end