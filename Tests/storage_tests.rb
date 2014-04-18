require 'test/unit'
require_relative '../lib/asposesdk'

class StorageTests < Test::Unit::TestCase

  def test_get_files
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new

    response = folder.get_files
    assert_instance_of(Array,response)
  end

  def test_file_exists
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    assert_nothing_thrown 'Error' do
      folder.file_exists('testfile.jpeg')
    end
  end

  def test_create_folder
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.create_folder('testing123')
    assert_equal true, response
  end

  def test_upload_file
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_uploadfile.docx'
    assert_equal true, response
  end

  def test_get_file
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.get_file 'testfile.jpeg'
    Aspose::Cloud::Common::Utils.save_file response, Aspose::Cloud::Common::AsposeApp.output_location + 'testfile.jpeg'
    assert_equal true, File.exist?(Aspose::Cloud::Common::AsposeApp.output_location + 'testfile.jpeg')
  end

end