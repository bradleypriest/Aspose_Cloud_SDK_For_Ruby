# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location/'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of cells converter class
cells_converter = Aspose::Cloud::Cells::Converter.new('testing.xls')

# Convert an excel file on storage to any of supported output formats
# output file will be stored on local drive at output_location
cells_converter.convert('output_filename','output_extension')