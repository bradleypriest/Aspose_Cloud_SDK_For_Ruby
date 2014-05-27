require 'test/unit'
require_relative '../lib/asposecloudsdk'

class CellTests < Test::Unit::TestCase
  def test_convert_storage_file
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create Object of folder class
    folder = Aspose::Cloud::AsposeStorage::Folder.new
    response = folder.upload_file './Data/test_convert_cell.xlsx'
    assert_equal true, response

    # Create object of cell converter class
    converter = Aspose::Cloud::Cells::Converter.new('test_convert_cell.xlsx')
    assert_nothing_thrown 'Error' do
      converter.convert('./Output/converted_file.tiff','tiff')
    end

    assert_equal true, File.exist?('./Output/converted_file.tiff')
  end
end