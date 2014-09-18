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

class StorageTests < Test::Unit::TestCase

  def setup
    file = File.read('setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end

  def test_get_files
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new

    response = folder.get_files
    assert_instance_of(Array,response)
  end

  def test_file_exists
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    assert_nothing_thrown 'Error' do
      folder.file_exists('testfile.jpeg')
    end
  end

  def test_create_folder
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.create_folder('testing123')
    assert_equal true, response
  end

  def test_upload_file
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_uploadfile.docx'
    assert_equal true, response
  end

  def test_get_file
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.get_file 'testfile.jpeg'
    Aspose::Cloud::Common::Utils.save_file response, Aspose::Cloud::Common::AsposeApp.output_location + 'testfile.jpeg'
    assert_equal true, File.exist?(Aspose::Cloud::Common::AsposeApp.output_location + 'testfile.jpeg')
  end

end