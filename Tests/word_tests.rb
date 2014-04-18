require 'test/unit'
require_relative '../lib/asposesdk'

class WordTests < Test::Unit::TestCase
  def test_convert_local_file
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of word converter class
    converter = Aspose::Cloud::Words::Converter.new('file_on_storage.doc')

    converter.convert_local_file('./Data/test_convertlocal.docx','./Output/converted_file.pdf','pdf')
    assert_equal true, File.exist?('./Output/converted_file.pdf')
  end
end