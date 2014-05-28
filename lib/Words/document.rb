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
      class Document
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/#{@filename}"
        end

=begin
  Appends a list of documents to this one.
  @param string append_docs
  @param import_format_modes
  @param source_folder
=end
        def append_document(append_docs, import_format_modes, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'append_docs not specified.' if append_docs.empty?
          raise 'import_format_modes not specified.' if import_format_modes.empty?

          docs = Array.new
          append_docs.to_enum.with_index(0).each { |item,i|
            docs.push({ :Href => folder_name.empty? ? item : "#{folder_name}/#{item}", :ImportFormatMode => import_format_modes[i] })
          }
          json_data = JSON.generate({:DocumentEntries => docs})

          str_uri = "#{@base_uri}/appendDocument"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties   
=end

        def get_document_info(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = Aspose::Cloud::Common::Utils.append_storage(@base_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept => 'application/json'}))['Document']
        end

=begin
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties
   @param string property_name
=end
        def get_property(property_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DocumentProperty']
        end

=begin
   Set document property
   @param string property_name
   @param string property_value
=end
        def set_property(property_name, property_value, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?
          raise 'property_value not specified.' if property_value.empty?

          json_data = JSON.generate('Value'=>property_value)

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'}))['DocumentProperty']
        end

=begin
   Delete a document property
   @param string property_name
=end
        def delete_property(property_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

=begin
   Get Document's properties
=end
        def get_properties(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DocumentProperties']['List']
        end
      end
    end
  end
end