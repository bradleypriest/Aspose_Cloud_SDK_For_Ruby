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

class PdfTests < Test::Unit::TestCase

  def setup
    file = File.read('setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end

  def test_page_count
    # Create Object of Pdf Document Class
    document = Aspose::Cloud::Pdf::Document.new('dummyfile.pdf')
    document.create_empty_pdf()

    assert_equal true, File.exist?('./Output/dummyfile.pdf')

    pages = document.get_page_count()
    document.add_new_page()

    assert_equal pages+1, document.get_page_count()

    document.delete_page(1)

    assert_equal pages, document.get_page_count()

  end

  def test_create_empty_pdf
    # Create Object of Pdf Document Class
    document = Aspose::Cloud::Pdf::Document.new('dummyfile.pdf')
    document.create_empty_pdf()

    assert_equal true, File.exist?('./Output/dummyfile.pdf')

  end

  def test_convert_local_file
    # Create object of pdf converter class
    converter = Aspose::Cloud::Pdf::Converter.new('file_on_storage.pdf')

    converter.convert_local_file('./Data/test_convertlocal.pdf','./Output/converted_file.doc','doc')
    assert_equal true, File.exist?('./Output/converted_file.doc')
  end

  def test_convert_storage_file
    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_file_on_storage.pdf'
    assert_equal true, response

    # Create object of pdf converter class
    converter = Aspose::Cloud::Pdf::Converter.new('test_file_on_storage.pdf')
    assert_nothing_thrown 'Error' do
      converter.convert('doc')
    end

    assert_equal true, File.exist?('./Output/test_file_on_storage.doc')
  end

  def test_replace_text
    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_replace_text.pdf'
    assert_equal true, response

    # Create object of pdf text editor class
    editor = Aspose::Cloud::Pdf::TextEditor.new('test_replace_text.pdf')
    assert_nothing_thrown 'Error' do
      response = editor.replace_text 'Kevin', 'Nick', false, 1
    end

    assert_equal true, response
  end
end