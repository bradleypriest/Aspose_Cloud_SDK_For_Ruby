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
    module Slides
      class Converter
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/slides/' + @filename
        end

=begin
  Saves a particular slide into various formats with specified width and height
=end    
        def convert_to_image(slide_number, image_format, width, height, folder_name = '', storage_type = 'Aspose', storage_name = '')
            raise 'slide_number not specified.' if slide_number.nil?
            raise 'image_format not specified.' if image_format.empty?
            raise 'width not specified.' if width <= 0
            raise 'height not specified.' if height <= 0

            str_uri = "#{@base_uri}/slides/#{slide_number}"
            qry = Hash.new
            qry[:format] = image_format
            qry[:width] = width
            qry[:height] = height
            str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

            if valid_output.empty?
              output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{image_format}"
              Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
            end
            valid_output
        end

=begin
  convert a document to SaveFormat
=end    
        def convert(slide_number, save_format, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number.nil?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{@base_uri}/slides/#{slide_number}?format=#{save_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end
      end
    end
  end
end