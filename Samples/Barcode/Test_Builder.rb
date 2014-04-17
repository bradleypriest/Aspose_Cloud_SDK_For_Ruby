# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location/'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of builder class
barcode = Aspose::Cloud::Barcode::Builder.new

# Save method will generate the barcode of given text and output will be saved
# as barcodeQR.png at path/to/output/location/
barcode.save('Text to generate barcode','QR','png')

