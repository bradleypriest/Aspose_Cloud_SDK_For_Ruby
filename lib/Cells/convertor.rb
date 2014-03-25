module Aspose
  module Cloud
    module Cells
      class Converter
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/cells/#{@filename}"
        end

        def convert(output_filename, save_format, password='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'output_filename not specified.' if output_filename.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}"
          qry = Hash.new
          qry[:format] = save_format
          qry[:password] = password unless password.empty?
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}.#{save_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def convert_to_image(output_filename, worksheet_name, save_format, password='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'output_filename not specified.' if output_filename.empty?
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}"
          qry = Hash.new
          qry[:format] = save_format
          qry[:password] = password unless password.empty?
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}.#{save_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def picture_to_image(picture_index, worksheet_name, save_format, password='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'picture_index not specified.' if picture_index.nil?
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/pictures/#{picture_index}"
          qry = Hash.new
          qry[:format] = save_format
          qry[:password] = password unless password.empty?
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def oleobject_to_image(object_index, worksheet_name, save_format, password='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'object_index not specified.' if object_index.nil?
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/oleobjects/#{object_index}"
          qry = Hash.new
          qry[:format] = save_format
          qry[:password] = password unless password.empty?
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def chart_to_image(chart_index, worksheet_name, save_format, password='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'chart_index not specified.' if chart_index.nil?
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/charts/#{chart_index}"
          qry = Hash.new
          qry[:format] = save_format
          qry[:password] = password unless password.empty?
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

        def autoshape_to_image(shape_index, worksheet_name, save_format, password='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'shape_index not specified.' if shape_index.nil?
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/autoshapes/#{shape_index}"
          qry = Hash.new
          qry[:format] = save_format
          qry[:password] = password unless password.empty?
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end
      end  
    end
    
  end
end