require 'test/unit'
require_relative '../lib/asposecloud'

class TasksTests < Test::Unit::TestCase
  def test_convert_storage_file
    Aspose::Cloud::Common::AsposeApp.app_key = '****'
    Aspose::Cloud::Common::AsposeApp.app_sid = '****'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_tasks.mpp'
    assert_equal true, response

    # Create object of pdf converter class
    converter = Aspose::Cloud::Tasks::Converter.new('test_tasks.mpp')
    assert_nothing_thrown 'Error' do
      converter.convert('pdf')
    end

    assert_equal true, File.exist?('./Output/test_tasks.pdf')
  end
end
