module Aspose
  module Cloud
    module Words
      class Converter
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/words/' + @filename
        end

        def convert(save_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}?format=#{save_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end

        def convert_local_file(input_file_path, output_filename, save_format)
          raise 'input_file_path not specified.' if input_file_path.empty?
          raise 'output_filename not specified.' if output_filename.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/convert?format=#{save_format}"
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = Aspose::Cloud::Common::Utils.upload_file_binary(input_file_path, signed_str_uri)

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            save_format = 'zip' if save_format.eql?('html')
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}.#{save_format}"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end
      end
    end
  end
end