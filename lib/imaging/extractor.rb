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
    module Imaging
      class Extractor
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/imaging/#{@filename}"
        end

        def get_tiff_frame_properties(frame_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'frame_id not specified.' if frame_id.nil?

          str_uri = "#{@base_uri}/frames/#{frame_id}/properties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response = JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))
        end

        def extract_frame(frame_id, output_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'frame_id not specified.' if frame_id.nil?
          raise 'output_filename not specified.' if output_filename.empty?

          str_uri = "#{@base_uri}/frames/#{frame_id}?saveOtherFrames=false&outPath=#{output_filename}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}_updated.tiff"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end

        def resize_frame(frame_id, new_width, new_height, output_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'frame_id not specified.' if frame_id.nil?
          raise 'new_width not specified.' if new_width.nil?
          raise 'new_height not specified.' if new_height.nil?
          raise 'output_filename not specified.' if output_filename.empty?

          str_uri = "#{@base_uri}/frames/#{frame_id}?saveOtherFrames=false&newWidth=#{new_width}&newHeight=#{new_height}&outPath=#{output_filename}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}_updated.tiff"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end

        def crop_frame(frame_id, x_position, y_position, rect_width, rect_height, output_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'frame_id not specified.' if frame_id.nil?
          raise 'x_position not specified.' if x_position.nil?
          raise 'y_position not specified.' if y_position.nil?
          raise 'rect_width not specified.' if rect_width.nil?
          raise 'rect_height not specified.' if rect_height.nil?
          raise 'output_filename not specified.' if output_filename.empty?

          str_uri = "#{@base_uri}/frames/#{frame_id}?saveOtherFrames=false&x=#{x_position}&y=#{y_position}&rectWidth=#{rect_width}&rectHeight=#{rect_height}&outPath=#{output_filename}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}_updated.tiff"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end

        def rotate_frame(frame_id, rotate_flip_method, output_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'frame_id not specified.' if frame_id.nil?
          raise 'rotate_flip_method not specified.' if rotate_flip_method.empty?
          raise 'output_filename not specified.' if output_filename.empty?

          str_uri = "#{@base_uri}/frames/#{frame_id}?saveOtherFrames=false&rotateFlipMethod=#{rotate_flip_method}&outPath=#{output_filename}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}_updated.tiff"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end

        def manipulate_frame(frame_id, rotate_flip_method, new_width, new_height, x_position, y_position, rect_width, rect_height, output_filename, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'frame_id not specified.' if frame_id.nil?
          raise 'rotate_flip_method not specified.' if rotate_flip_method.empty?
          raise 'new_width not specified.' if new_width.nil?
          raise 'new_height not specified.' if new_height.nil?
          raise 'x_position not specified.' if x_position.nil?
          raise 'y_position not specified.' if y_position.nil?
          raise 'rect_width not specified.' if rect_width.nil?
          raise 'rect_height not specified.' if rect_height.nil?
          raise 'output_filename not specified.' if output_filename.empty?

          str_uri = "#{@base_uri}/frames/#{frame_id}?saveOtherFrames=true&rotateFlipMethod=#{rotate_flip_method}&newWidth=#{new_width}&newHeight=#{new_height}&x=#{x_position}&y=#{x_position}&rectWidth=#{rect_width}&rectHeight=#{rect_height}&outPath=#{output_filename}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}_updated.tiff"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end


      end
    end
  end
end
