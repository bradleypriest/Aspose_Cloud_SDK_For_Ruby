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

  def setup
    file = File.read('setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end

  def test_get_mail_merge_fields
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    info = extractor.get_mail_merge_fields
    assert_kind_of(Hash, info)
  end

  def test_update_page_setup
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    document = Aspose::Cloud::Words::Document.new('test_multi_pages.docx')
    xml = '<PageSetup>
    <LeftMargin>99</LeftMargin>
    <Orientation>Landscape</Orientation>
    <PaperSize>A5</PaperSize>
  </PageSetup>'
    info = document.update_page_setup(0,xml)
    assert_kind_of(Hash, info)
    puts info
  end

  def test_get_page_setup
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    document = Aspose::Cloud::Words::Document.new('test_multi_pages.docx')
    info = document.get_page_setup(0)
    assert_kind_of(Hash, info)
  end

  def test_get_paragraph_run_font
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    font = extractor.get_paragraph_run_font(0,0)
    assert_kind_of(Hash, font)
  end

  def test_get_paragraph_run
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    run = extractor.get_paragraph_run(0,0)
    assert_kind_of(Hash, run)
  end

  def test_get_paragraph
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    para = extractor.get_paragraph(0)
    assert_kind_of(Hash, para)
  end

  def test_get_paragraphs
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    paras = extractor.get_paragraphs
    assert_kind_of(Hash, paras)
  end

  def test_get_section
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    section = extractor.get_section(0)
    assert_kind_of(Hash, section)
  end

  def test_get_sections
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    extractor = Aspose::Cloud::Words::Extractor.new('test_multi_pages.docx')
    sections = extractor.get_sections
    assert_kind_of(Hash, sections)
  end


  def test_split_document
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_multi_pages.docx'
    assert_equal true, response

    document = Aspose::Cloud::Words::Document.new('test_multi_pages.docx')
    response = document.split_document(1,2,'pdf');
    assert_kind_of(Hash, response)
  end

  def test_save_as
    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_uploadfile.docx'
    assert_equal true, response

    document = Aspose::Cloud::Words::Document.new('test_uploadfile.docx')
    xml_str = '<PdfSaveOptions>
                 <SaveFormat>pdf</SaveFormat>
                 <FileName>test_file_options.pdf</FileName>
                 <ImageCompression>Jpeg</ImageCompression>
                 <JpegQuality>70</JpegQuality>
                 <TextCompression>Flate</TextCompression>
                </PdfSaveOptions>'
    document.save_as(xml_str)

    assert_equal true, File.exist?('./output/test_file_options.pdf')

  end

  def test_document_properties

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
    # Create object of word converter class
    converter = Aspose::Cloud::Words::Converter.new('file_on_storage.doc')

    converter.convert_local_file('./Data/test_convertlocal.docx','./Output/converted_file.pdf','pdf')
    assert_equal true, File.exist?('./Output/converted_file.pdf')
  end
end
