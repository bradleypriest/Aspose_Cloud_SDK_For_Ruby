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
    module Pdf
      class Document
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename
        end

        def get_page_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/pages"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)

          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Pages']['List'].length
        end
    
        def append_document(append_file, startpage = 0, endpage = 0, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'append_file not specified.' if append_file.empty?
          str_uri = "#{@base_uri}/appendDocument"
          qry = Hash.new
          qry[:appendFile] = append_file
          qry[:startPage] = startpage unless startpage == 0
          qry[:endPage] = endpage unless endpage == 0
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.post(signed_str_uri, '', {:accept=>'application/json'})
          Aspose::Cloud::Common::Utils.validate_output(response_stream)
        end

        def merge_documents(merged_filename, source_files, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'merged_filename not specified.' if merged_filename.empty?
          raise 'source_files not specified.' if source_files.nil? || source_files.length < 2

          json_data = JSON.generate( 'List'=>source_files )
          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/pdf/#{merged_filename}/merge"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          JSON.parse(RestClient.put(signed_str_uri,json_data,{ :content_type=>:json, :accept=>'application/json' }))['Status'] == 'OK' ? true : false
        end
    
        def get_form_field_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/fields"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Fields']['List'].length
        end

        def get_form_fields(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/fields"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Fields']['List']
        end

        def get_form_field(field_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'field_name not specified.' if field_name.empty?

          str_uri = "#{@base_uri}/fields/#{field_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Field']
        end

        def create_from_html (html_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'html_filename not specified.' if html_filename.empty?

          str_uri = "#{@base_uri}"
          qry = Hash.new
          qry[:templatefile] = html_filename
          qry[:templatetype] = 'html'
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.put(signed_str_uri,'',{:accept=>'application/json'})
          Aspose::Cloud::Common::Utils.validate_output(response_stream)
        end

        def create_from_xml (xslt_filename, xml_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'xslt_filename not specified.' if xslt_filename.empty?
          raise 'xml_filename not specified.' if xml_filename.empty?

          str_uri = "#{@base_uri}"
          qry = Hash.new
          qry[:templatefile] = xslt_filename
          qry[:datafile] = xml_filename
          qry[:templatetype] = 'xml'
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.put(signed_str_uri,'',{:accept=>'application/json'})
          Aspose::Cloud::Common::Utils.validate_output(response_stream)
        end

        def create_empty_pdf(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.put(signed_str_uri,'',{:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

        def add_new_page(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/pages"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.put(signed_str_uri,'',{:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

        def delete_page(page_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'page_number not specified.' if page_number.nil?

          str_uri = "#{@base_uri}/pages/#{page_number}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.delete(signed_str_uri,{:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

        def move_page(page_number, new_location, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'page_number not specified.' if page_number.nil?
          raise 'new_location not specified.' if new_location.nil?

          str_uri = "#{@base_uri}/pages/#{page_number}/movepage?newindex=#{new_location}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, '', {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

        def replace_image_stream(page_number, image_index, image_stream, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'page_number not specified.' if page_number.nil?
          raise 'image_index not specified.' if image_index.nil?
          raise 'image_stream not specified.' if image_stream.nil?

          str_uri = "#{@base_uri}/pages/#{page_number}/images/#{image_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, image_stream, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

        def replace_image_file(page_number, image_index, image_file, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'page_number not specified.' if page_number.nil?
          raise 'image_index not specified.' if image_index.nil?
          raise 'image_file not specified.' if image_file.nil?

          str_uri = "#{@base_uri}/pages/#{page_number}/images/#{image_index}?imagefile=#{image_file}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, '', {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

        def get_document_property(property_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DocumentProperty']
        end

        def get_document_properties(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DocumentProperties']['List']
        end

        def set_document_property(property_name, property_value, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?
          raise 'property_value not specified.' if property_value.empty?

          json_data = JSON.generate('Value'=>property_value)

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'}))['DocumentProperty']
        end

        def remove_all_properties(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end
      end
    end
  end
end