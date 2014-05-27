require 'test/unit'
require_relative '../lib/asposecloudsdk'

class BarcodeTests < Test::Unit::TestCase
  def test_save_barcode
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of barcode builder class
    builder = Aspose::Cloud::Barcode::Builder.new
    builder.save('Text to generate barcode','QR','png')
    assert_equal true, File.exist?('./Output/barcodeQR.png')
  end

  def test_read_barcode_local
    Aspose::Cloud::Common::AsposeApp.app_key = '8356c76c7412f32bb85ae7472e842da4'
    Aspose::Cloud::Common::AsposeApp.app_sid = '8EB6E644-4A40-4B50-8012-135D1F8F7513'
    Aspose::Cloud::Common::AsposeApp.output_location = './Output/'
    Aspose::Cloud::Common::Product.set_base_product_uri('http://test.aspose.com/v1.1')

    # Create object of barcode reader class
    reader = Aspose::Cloud::Barcode::Reader.new('storage_file_name.png')
    response = reader.read_from_local_image('./Data/barcodeQR.png')
    assert_instance_of Array, response
  end
end