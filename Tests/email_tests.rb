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

class EmailTests < Test::Unit::TestCase

  def test_convert_storage_file
    Aspose::Cloud::Common::AsposeApp.app_key = '****'
    Aspose::Cloud::Common::AsposeApp.app_sid = '****'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/email_test.eml'
    assert_equal true, response

    # Create object of pdf converter class
    converter = Aspose::Cloud::Email::Converter.new('email_test.eml')
    assert_nothing_thrown 'Error' do
      converter.convert('msg')
    end

    assert_equal true, File.exist?('./Output/email_test.msg')
  end

end
