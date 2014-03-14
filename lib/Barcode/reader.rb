module Aspose
  module Cloud
    module Barcode
      class Reader
        def initialize(filename)
          @filename = filename
          raise 'Base file is not specified' if @filename.empty?
        end

        def read(symbology='', remote_folder='', storage_type='Aspose', storage_name='')

            str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/barcode/#{@filename}/recognize"
            str_uri = "#{str_uri}?type=#{symbology}" unless symbology.empty?
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,remote_folder,storage_name,storage_type)

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            json['Code'] == 200 ? json['Barcodes'] : nil
        end

        def read_from_local_image(local_image, remote_folder='', symbology='', format='', storage_type='Aspose', storage_name='')
            raise 'local image file not provided.' if local_image.empty?

            folder = Aspose::Cloud::AsposeStorage::Folder.new
            folder.upload_file(local_image, remote_folder, storage_type, storage_name)

            readr(File.basename(local_image), remote_folder, symbology, format)
        end

        def readr(remote_image_name, remote_folder='', symbology='', format='', storage_type='Aspose', storage_name='')
          raise 'remote image file not provided.' if remote_image_name.empty?

          str_uri = "#{Aspose::Cloud::Common::Product.product_uri}/barcode/#{remote_image_name}/recognize"
          str_uri = "#{str_uri}?type=#{symbology}" unless symbology.empty?
          str_uri = "#{str_uri}?format=#{format}" unless format.empty?
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,remote_folder,storage_name,storage_type)

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_uri, :accept => 'application/json')
          json = JSON.parse(response)
          json['Code'] == 200 ? json['Barcodes'] : nil
        end
      end
    end

  end
end