# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location/'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of barcode reader class
reader = Aspose::Cloud::Barcode::Reader.new('storage_file_name.ext')

# Read a barcode image from local disc
reader.read_from_local_image('path/to/local/barcode/image/file')

