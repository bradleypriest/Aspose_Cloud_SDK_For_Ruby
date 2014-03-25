# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location/'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of pdf text editor class
pdf_editor = Aspose::Cloud::Pdf::TextEditor.new('filename/at/storage')

# Search and replace the text in @filename on storage.
pdf_editor.replace_text('Find Text','Replace With',false,1)
