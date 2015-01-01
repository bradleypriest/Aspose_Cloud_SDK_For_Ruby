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
        
        def save_as(options_xml, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'options not specified.' if options_xml.empty?

          str_uri = "#{@base_uri}/saveAs"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri, folder_name, storage_name, storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.post(signed_str_uri, options_xml, {:content_type=>'application/xml', :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          return valid_output unless valid_output.empty?

          json_response = JSON.parse(response_stream)
          Aspose::Cloud::Common::Utils.download_file(json_response['SaveResult']['DestDocument']['Href'],
                                                     json_response['SaveResult']['DestDocument']['Href'],
                                                     folder_name,storage_name,storage_type)

        end

        def split_document(from, to, save_format='pdf', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'from page not specified.' if from.nil?
          raise 'to page not specified.' if to.nil?

          str_uri = "#{@base_uri}/split"
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri, {:from=>from, :to=>to, :format=>save_format})
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, nil, {:content_type=>:json, :accept=>'application/json'}))['SplitResult']
        end

        def get_page_setup(section_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'section_index not specified.' if section_index.nil?

          str_uri = "#{@base_uri}/sections/#{section_index}/pageSetup"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['PageSetup']
        end

        def update_page_setup(section_index, options_xml, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'section_index not specified.' if section_index.nil?
          raise 'options_xml not specified.' if options_xml.empty?

          str_uri = "#{@base_uri}/sections/#{section_index}/pageSetup"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, options_xml, {:content_type=>'application/xml', :accept=>'application/json'}))['PageSetup']
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

=begin
   Get the Current Protection of the Word document
=end
        def get_protection(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/protection"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['ProtectionData']['ProtectionType']
        end

=begin
   Protect a Word Document
=end
        def protect_document(password, protection_type = 'AllowOnlyComments', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'password not specified.' if password.empty?

          str_uri = "#{@base_uri}/protection"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          data = Hash['Password' => password, 'ProtectionType' => protection_type]
          json_data = JSON.generate(data)

          response_stream = RestClient.put(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
   Modify Protection of the Word Document
=end
        def update_protection(old_password, new_password, protection_type = 'AllowOnlyComments', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'old_password not specified.' if old_password.empty?
          raise 'new_password not specified.' if new_password.empty?

          str_uri = "#{@base_uri}/protection"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          data = Hash['Password' => old_password, 'NewPassword' => new_password, 'ProtectionType' => protection_type]
          json_data = JSON.generate(data)

          response_stream = RestClient.post(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
   Get all Hyperlinks from a Word
=end
        def get_hyperlinks(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/hyperlinks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Hyperlinks']['HyperlinkList']
        end

=begin
   Get a Particular Hyperlink from a Word
=end
        def get_hyperlink(hyperlink_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'Hyperlink index not provided.' if hyperlink_index.nil?

          str_uri = "#{@base_uri}/hyperlinks/#{hyperlink_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Hyperlink']
        end

=begin
   Get Hyperlinks Count from a Word
=end
        def get_hyperlinks_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/hyperlinks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          json = JSON.parse(response)
          json['Code'] == 200 ? json['Hyperlinks']['HyperlinkList'].count : nil
        end

=begin
   Get all Bookmarks from a Word
=end
        def get_bookmarks(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/bookmarks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Bookmarks']['BookmarkList']
        end

=begin
   Get a Particular Bookmark from a Word
=end
        def get_bookmark(bookmark_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'Bookmark name not specified.' if bookmark_name.empty?

          str_uri = "#{@base_uri}/bookmarks/#{bookmark_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Bookmark']
        end

=begin
   Get Bookmarks Count from a Word
=end
        def get_bookmarks_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/bookmarks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          json = JSON.parse(response)
          json['Code'] == 200 ? json['Bookmarks']['BookmarkList'].count : nil
        end

=begin
   Remove all Headers and Footers
=end
        def delete_headers_footers(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/headersFooters"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

=begin
   Accept All Tracking Changes in the Document
=end
        def accept_tracking_changes(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/revisions/acceptAll"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.post(signed_str_uri, {:content_type=>:json, :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
   Reject All Tracking Changes in the Document
=end
        def reject_tracking_changes(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/revisions/rejectAll"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.post(signed_str_uri, {:content_type=>:json, :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
   Insert Page Number Field into the Document
=end
        def insert_page_number(alignment, format, is_top = false, set_page_number_on_first_page = false, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'alignment not specified.' if alignment.empty?
          raise 'format not specified.' if format.empty?
          #raise 'is_top not specified.' if is_top.empty?
          #raise 'set_page_number_on_first_page not specified.' if set_page_number_on_first_page.empty?

          str_uri = "#{@base_uri}/insertPageNumbers"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          data = Hash['Format' => format, 'Alignment' => alignment, 'IsTop' => is_top, 'SetPageNumberOnFirstPage' => set_page_number_on_first_page]
          json_data = JSON.generate(data)

          response_stream = RestClient.post(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
   Update All Fields in the World Document
=end
        def update_fields(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/updateFields"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.post(signed_str_uri, '', {:accept=>'application/json'})
          json = JSON.parse(response)
          json['Code'] == 200 ? true : false
        end

      end
    end
  end
end
