# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'F:\\'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of slides converter class
slides_converter = Aspose::Cloud::Slides::Converter.new('filename/on/storage')

# Convert a slide to any of supported formats e.g (jpeg,tiff,png)
# @filename will be used as the source file
# output will be stored on output_location
slides_converter.convert(1,'png')