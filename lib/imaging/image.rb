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
      class Image
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/imaging/#{@filename}"
        end

        def resize_image(input_file_path, new_width, new_height, output_filename, save_format)
          raise 'input_file_path not specified.' if input_file_path.empty?
          raise 'output_filename not specified.' if output_filename.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/imaging/resize"
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri, {:newWidth=> new_width,
                                                                     :newHeight=> new_height, :format=> save_format})
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.post(signed_str_uri, File.new(input_file_path, 'rb'), {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            save_format = 'zip' if save_format.eql?('html')
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}.#{save_format}"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end


        def crop_image(x, y, width, height, output_path, save_format)
          raise 'input_file_path not specified.' if input_file_path.empty?
          raise 'save_format not specified.' if save_format.empty?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/imaging/#{@filename}/crop"
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri, {:width=> width,
                                                                     :height=> height,
                                                                     :x=> x,
                                                                     :y=> y,
                                                                     :outputPath=> output_path,
                                                                     :format=> save_format})
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            save_format = 'zip' if save_format.eql?('html')
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end


        def rotate_image(method, output_path, save_format)

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/imaging/#{@filename}/rotateflip"
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri, {:method=> method,
                                                                     :outputPath=> output_path,
                                                                     :format=> save_format})
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})

          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)

          if valid_output.empty?
            save_format = 'zip' if save_format.eql?('html')
            output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(@filename)}.#{save_format}"
            Aspose::Cloud::Common::Utils.save_file(response_stream,output_path)
          end
          valid_output
        end

      end
    end
  end
end