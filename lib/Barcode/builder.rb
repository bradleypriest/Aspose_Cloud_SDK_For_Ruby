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
    module Barcode
      class Builder
        def save(code_text, symbology='QR', image_format='png', remote_folder='', storage_type='Aspose', storage_name='', x_resolution=nil, y_resolution=nil, x_dimension=nil, y_dimension=nil)

          raise 'code_text can not be empty.' if code_text.empty?
          raise 'symbology can not be empty.' if symbology.empty?
          raise 'image_format can not be empty.' if image_format.empty?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/barcode/generate?"
          str_uri = "#{str_uri}text=#{code_text}&type=#{symbology}&format=#{image_format}"
          str_uri = "#{str_uri}&resolutionX=#{x_resolution}" unless x_resolution.nil?
          str_uri = "#{str_uri}&resolutionY=#{y_resolution}" unless y_resolution.nil?
          str_uri = "#{str_uri}&dimensionX=#{x_dimension}" unless x_dimension.nil?
          str_uri = "#{str_uri}&dimensionY=#{y_dimension}" unless y_dimension.nil?
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,remote_folder,storage_name,storage_type)

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_uri, :accept => 'application/json')
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}barcode#{symbology}.#{image_format}"
          Aspose::Cloud::Common::Utils.save_file(response, output_path)
          output_path
        end
      end
    end
  end
end