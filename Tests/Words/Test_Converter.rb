# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location/'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of words converter class
words_converter = Aspose::Cloud::Words::Converter.new('path/to/filename')

# Convert a local pdf file to any format (tiff,doc, etc)
# output file will be stored on local drive at output_location
words_converter.convert_local_file('path/to/input/filename.doc','output_filename_without_extension','output_extension')