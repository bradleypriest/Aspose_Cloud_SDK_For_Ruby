# Copyright (c) Aspose 2002-2014. All Rights Reserved.
#
# LICENSE: This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://opensource.org/licenses/gpl-3.0.html>;.
#
# @package Aspose_Cloud_SDK_For_Ruby
# @author  Assad Mahmood Qazi <assad.mahmood@aspose.com>
# @link    https://github.com/asposeforcloud/Aspose_Cloud_SDK_For_Ruby/tree/revamp

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
          json = JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
          json['Code'] == 200 ? true : false
        end
      end
    end
  end
end