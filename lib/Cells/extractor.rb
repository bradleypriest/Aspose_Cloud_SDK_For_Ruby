module Aspose
  module Cloud
    module Cells
      class Extractor
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/cells/#{@filename}"
        end

        def get_picture(worksheet_name, picture_index, image_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'picture_index not specified.' if picture_index.nil?
          raise 'image_format not specified.' if image_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/pictures/#{picture_index}?format=#{image_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{worksheet_name}.#{image_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def get_ole_object(worksheet_name, object_index, image_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'object_index not specified.' if object_index.nil?
          raise 'image_format not specified.' if image_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/oleobjects/#{object_index}?format=#{image_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{worksheet_name}.#{image_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def get_chart(worksheet_name, chart_index, image_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'chart_index not specified.' if chart_index.nil?
          raise 'image_format not specified.' if image_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/charts/#{chart_index}?format=#{image_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{worksheet_name}.#{image_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def get_auto_shape(worksheet_name, shape_index, image_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'shape_index not specified.' if shape_index.nil?
          raise 'image_format not specified.' if image_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/autoshapes/#{shape_index}?format=#{image_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{worksheet_name}.#{image_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end
      end
    end
  end
end 