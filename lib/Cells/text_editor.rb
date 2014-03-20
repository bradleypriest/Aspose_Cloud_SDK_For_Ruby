module Aspose
  module Cloud
    module Cells
      class TextEditor
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/cells/#{@filename}"
        end

        def find_text(text, folder_name='', storage_type = 'Aspose', storage_name = '')
          raise 'text not specified.' if text.empty?

          str_uri = "#{@base_uri}/findText?text=#{text}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, '', {:accept=>'application/json'}))['TextItems']['TextItemList']
        end

        def find_text_in_worksheet(text, worksheet_name, folder_name='', storage_type = 'Aspose', storage_name = '')
          raise 'text not specified.' if text.empty?
          raise 'worksheet_name not specified.' if worksheet_name.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/findText?text=#{text}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, '', {:accept=>'application/json'}))['TextItems']['TextItemList']
        end

        def get_text_items(worksheet_name, folder_name='', storage_type = 'Aspose', storage_name = '')
          raise 'text not specified.' if text.empty?
          raise 'worksheet_name not specified.' if worksheet_name.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/textItems"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['TextItems']['TextItemList']
        end

        def replace_text(old_text, new_text, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'old_text not specified.' if old_text.empty?
          raise 'new_text not specified.' if new_text.empty?

          str_uri = "#{@base_uri}/replaceText"
          qry = Hash.new
          qry[:oldValue] = old_text
          qry[:newValue] = new_text
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)

          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri,'',{ :accept => 'application/json' })
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? true : valid_output
        end

        def replace_text_in_worksheet(worksheet_name, old_text, new_text, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          raise 'old_text not specified.' if old_text.empty?
          raise 'new_text not specified.' if new_text.empty?

          str_uri = "#{@base_uri}/worksheets/#{worksheet_name}/replaceText"
          qry = Hash.new
          qry[:oldValue] = old_text
          qry[:newValue] = new_text
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)

          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri,'',{ :accept => 'application/json' })
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? true : valid_output
        end
      end
    end
  end
end