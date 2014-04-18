require 'test/unit'
require_relative '../lib/asposesdk'

class PdfTests < Test::Unit::TestCase

  def test_convert_local_file
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of pdf converter class
    converter = Aspose::Cloud::Pdf::Converter.new('file_on_storage.pdf')

    converter.convert_local_file('./Data/test_convertlocal.pdf','./Output/converted_file.doc','doc')
    assert_equal true, File.exist?('./Output/converted_file.doc')
  end

  def test_convert_storage_file
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

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
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

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