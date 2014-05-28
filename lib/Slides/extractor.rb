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
      class Extractor
        def initialize (filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/slides/' + @filename
        end
=begin
  Gets total number of images in a presentation
=end
        def get_image_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/images"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Images']['List'].length
        end

=begin
  Gets number of images in the specified slide
	@param number slide_number
=end
        def get_slide_image_count(slide_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0

          str_uri = "#{@base_uri}/slides/#{slide_number}/images"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Images']['List'].length
        end
=begin
  Gets all shapes from the specified slide
	@param number slide_number
=end
        def get_shapes(slide_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0

          str_uri = "#{@base_uri}/slides/#{slide_number}/shapes"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          shapes = Hash.new
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['ShapeList']['ShapesLinks'].each { |item|
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(item['Uri']['Href'])
            shapes.push(JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'})))
          }
          shapes
        end

=begin
  Get color scheme from the specified slide
	@param number slide_number
=end
        def get_color_scheme(slide_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0

          str_uri = "#{@base_uri}/slides/#{slide_number}/theme/colorScheme"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['ColorScheme']
        end
=begin
  Get font scheme from the specified slide
	@param number slide_number
=end
        def get_font_scheme(slide_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0

          str_uri = "#{@base_uri}/slides/#{slide_number}/theme/fontScheme"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['FontScheme']
        end

=begin
  Get format scheme from the specified slide
	@param number slide_number
=end
        def get_format_scheme(slide_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0

          str_uri = "#{@base_uri}/slides/#{slide_number}/theme/formatScheme"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['FormatScheme']
        end

=begin
  Gets placeholder count from a particular slide
	@param number $slideNumber
=end
        def get_placeholder_count(slide_number, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0

          str_uri = "#{@base_uri}/slides/#{slide_number}/placeholders"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Placeholders']['PlaceholderLinks'].length
        end

=begin
  Gets placeholder count from a particular slide
	@param number $slideNumber
	@param number $placeholderIndex
=end
        def get_placeholder(slide_number, placeholder_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number <= 0
          raise 'placeholder_index not specified.' if placeholder_index.nil?

          str_uri = "#{@base_uri}/slides/#{slide_number}/placeholders/#{placeholder_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Placeholder']
        end
      end
    end
  end
end