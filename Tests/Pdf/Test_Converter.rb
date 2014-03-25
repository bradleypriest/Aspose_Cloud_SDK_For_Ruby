# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of pdf converter class
pdf_converter = Aspose::Cloud::Pdf::Converter.new('path/to/pdf/file/on/storage.pdf')

# Convert a local pdf file to any format (tiff,doc, etc) and store the output
# file locally
pdf_converter.convert_local_file("path/to/input/file.pdf",'output_filename_without_extension','output_file_extension')

# Convert a pdf file on storage to any format (tiff,doc, etc) and store the output
# file on storage. class variable @filename will be used to convert the file
pdf_converter.convert('doc')
