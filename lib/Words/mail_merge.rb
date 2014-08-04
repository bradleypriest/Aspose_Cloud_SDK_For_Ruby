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
    module Words
      class MailMerge
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/#{@filename}"
        end
    
=begin
   Executes mail merge with/without regions.
   @param string filename
   @param string str_xml
=end
        def execute_mail_merge(str_xml, with_regions=false, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'str_xml not specified.' if str_xml.empty?

          str_uri = "#{@base_uri}/executeMailMerge"
          str_uri = "#{str_uri}?withRegions=true" if with_regions
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, str_xml, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(JSON.parse(response_stream)['Document']['FileName'],@filename,folder_name,storage_name,storage_type) : valid_output
        end


=begin
   Executes mail merge with template.
   @param string str_xml
=end
        def execute_template(str_xml, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'str_xml not specified.' if str_xml.empty?

          str_uri = "#{@base_uri}/executeTemplate"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, str_xml, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(JSON.parse(response_stream)['Document']['FileName'],@filename,folder_name,storage_name,storage_type) : valid_output
        end
      end
    end
  end
end