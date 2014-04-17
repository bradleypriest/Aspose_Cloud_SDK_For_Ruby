# Require asposecloudsdk
require File.dirname(File.dirname(File.dirname(__FILE__))) + '/lib/asposecloudsdk'

app_sid = '****'
app_key = '****'

Aspose::Cloud::Common::AsposeApp.app_key = app_key
Aspose::Cloud::Common::AsposeApp.app_sid = app_sid
Aspose::Cloud::Common::AsposeApp.output_location = 'path/to/output/location'
Aspose::Cloud::Common::Product.set_base_product_uri('http://api.aspose.com/v1.1')

# Create object of folder class
folder = Aspose::Cloud::AsposeStorage::Folder.new

# Create folder
puts 'Folder Created Sucessfully.' if folder.create_folder('testFolder')

# Test fileExiss
puts 'File found.' if folder.file_exists('testFolder')

# Delete Folder
puts 'Folder Deleted.' if folder.delete_folder('testFolder')

#Upload a file
puts 'File uploaded successfully.' if folder.upload_file('path/to/output/location/file_to.upload')
