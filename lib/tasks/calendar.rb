module Aspose
  module Cloud
    module Tasks
      class Calendar
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/tasks/' + @filename
        end

        def get_calendars(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/calendars"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Calendars']['List']
        end

        def get_calendar(calendar_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'calendar_id not specified.' if calendar_id.nil?

          str_uri = "#{@base_uri}/calendars/#{calendar_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Calendar']
        end

        def delete_calendar(calendar_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'calendar_id not specified.' if calendar_id.nil?

          str_uri = "#{@base_uri}/calendars/#{calendar_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
        end

      end
    end
  end
end