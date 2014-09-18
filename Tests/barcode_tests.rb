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

require 'test/unit'
require_relative '../lib/asposecloud'

class BarcodeTests < Test::Unit::TestCase

  def setup
    file = File.read('setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end

  def test_save_barcode
    # Create object of barcode builder class
    builder = Aspose::Cloud::Barcode::Builder.new
    builder.save('Text to generate barcode','QR','png')
    assert_equal true, File.exist?('./Output/barcodeQR.png')
  end

  def test_read_barcode_local
    # Create object of barcode reader class
    reader = Aspose::Cloud::Barcode::Reader.new('storage_file_name.png')
    response = reader.read_from_local_image('./Data/barcodeQR.png')
    assert_instance_of Array, response
  end
end