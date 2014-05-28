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
      class Extractor
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/#{@filename}"
        end

=begin
   Gets Text items list from document
=end
        def get_text(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/textItems"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['TextItems']['List']
        end

=begin
   Get the OLE drawing object from document
   @param number index
   @param string output_format
=end

        def get_ole_data(ole_index, ole_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'ole_index not specified.' if ole_index.nil?
          raise 'ole_format not specified.' if ole_format.empty?

          str_uri = "#{@base_uri}/drawingObjects/#{ole_index}/oleData"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{ole_index}.#{ole_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

=begin
   Get the Image drawing object from document
   @param number index
   @param string render_format
=end
        def get_image_data(image_index, image_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'image_index not specified.' if image_index.nil?
          raise 'image_format not specified.' if image_format.empty?

          str_uri = "#{@base_uri}/drawingObjects/#{image_index}/imagedata"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{image_index}.#{image_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

=begin
   Convert drawing object to image
   @param number index
   @param string render_format
=end
        def convert_drawing_object(object_index, render_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'object_index not specified.' if object_index.nil?
          raise 'render_format not specified.' if render_format.empty?

          str_uri = "#{@base_uri}/drawingObjects/#{object_index}?format=#{render_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}_#{object_index}.#{render_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

=begin
   Get the List of drawing object from document	
=end
        def get_drawing_object_list(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/drawingObjects"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DrawingObjects']['List']
        end

=begin
   Get the drawing object from document	
   @param string object_uri
   @param string output_path
=end

        def get_drawing_object(object_uri, output_path, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'object_uri not specified.' if object_uri.empty?
          raise 'output_path not specified.' if output_path.empty?

          object_index = object_uri[-1]
          str_uri =  "#{Aspose::Cloud::Common::Product.product_uri}/words/#{object_uri}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          object_info = JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/#{object_uri}?format=jpeg"
          output_path = "#{output_path}/DrawingObject_#{object_index}.jpeg"

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/#{object_uri}/imageData" unless object_info['DrawingObject']['ImageDataLink'].nil?
          output_path = "#{output_path}/DrawingObject_#{object_index}.jpeg" unless object_info['DrawingObject']['ImageDataLink'].nil?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/words/#{object_uri}/oleData" unless object_info['DrawingObject']['OLEDataLink'].nil?
          output_path = "#{output_path}/DrawingObject_#{object_index}.xlsx" unless object_info['DrawingObject']['OLEDataLink'].nil?

          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end

=begin
   Get the List of drawing object from document
   @param string output_path
=end
        def get_drawing_objects(output_path, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'output_path not specified.' if output_path.empty?

          get_drawing_object_list(folder_name,storage_type,storage_name).each{ |obj|
            self.get_drawing_object(obj['link']['Href'],output_path)
          }
        end
      end
    end
  end
end
