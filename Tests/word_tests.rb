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

class WordTests < Test::Unit::TestCase

  def test_document_properties
    Aspose::Cloud::Common::AsposeApp.app_key = '****'
    Aspose::Cloud::Common::AsposeApp.app_sid = '****'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_uploadfile.docx'
    assert_equal true, response

    document = Aspose::Cloud::Words::Document.new('test_uploadfile.docx')
    document.set_property('Author', 'Kevin')

    auther = document.get_property('Author')

    assert_equal 'Kevin', auther['Value']

  end

  def test_convert_local_file
    Aspose::Cloud::Common::AsposeApp.app_key = '****'
    Aspose::Cloud::Common::AsposeApp.app_sid = '****'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

    # Create object of word converter class
    converter = Aspose::Cloud::Words::Converter.new('file_on_storage.doc')

    converter.convert_local_file('./Data/test_convertlocal.docx','./Output/converted_file.pdf','pdf')
    assert_equal true, File.exist?('./Output/converted_file.pdf')
  end
end
