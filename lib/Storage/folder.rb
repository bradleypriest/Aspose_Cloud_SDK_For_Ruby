module Aspose
  module Cloud

    module AsposeStorage
      # This class provides functionality to manage files in a Remote Aspose Folder
      class Folder

        def initialize
          @str_uri_folder = Aspose::Cloud::Common::Product.product_uri + '/storage/folder/'
          @str_uri_folder = Aspose::Cloud::Common::Product.product_uri + '/storage/folder/'
          @str_uri_file = Aspose::Cloud::Common::Product.product_uri + '/storage/file/'
          @str_uri_exist = Aspose::Cloud::Common::Product.product_uri + '/storage/exist/'
          @str_uri_disc = Aspose::Cloud::Common::Product.product_uri + '/storage/disc/'
        end

        # Uploads file from the local path to the remote folder.
        # * :localFilePath represents full local file path and name
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.		 
        def upload_file(local_file, remote_folder='', storage_type='Aspose', storage_name='')

          begin

            raise 'Local file not specified' if local_file.empty?

            if storage_type == 'Aspose'

              filename = File.basename(local_file)

              if remote_folder.empty?
                struri = Aspose::Cloud::Common::Product.product_uri + '/storage/file/' + filename
              else
                struri = Aspose::Cloud::Common::Product.product_uri + '/storage/file/' + remote_folder + '/' + filename
              end

              signeduri = Aspose::Cloud::Common::Utils.sign(struri)

            else

              filename = File.basename(local_file)

              if remote_folder.empty?
                struri = Aspose::Cloud::Common::Product.product_uri + '/storage/file/' + filename + '?storage=' + storage_name
              else
                struri = Aspose::Cloud::Common::Product.product_uri + '/storage/file/' + remote_folder + '/' + filename + '?storage=' + storage_name
              end

              signeduri = Aspose::Cloud::Common::Utils.sign(struri)

            end

            Aspose::Cloud::Common::Utils.upload_file_binary(local_file, signeduri)

          rescue Exception => e
            print e
          end
        end


        # Retrieves Files and Folder information from a remote folder. The method returns an Array of AppFile objects.
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.
        def get_files(remote_folder_path)

          str_url = @str_uri_folder + remote_folder_path
          str_url = str_url[0..-2] if remote_folder_path.empty?

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_url)
          response = RestClient.get(signed_uri, :accept => 'application/json')

          JSON.parse(response)['Files']

          #      urlFolder = $product_uri + '/storage/folder'
          #      urlFile = ''
          #      urlExist = ''
          #      urlDisc = ''
          #      if not remoteFolderPath.empty?
          #        urlFile = $product_uri + '/storage/folder/' + remoteFolderPath 
          #      end             
          #      signedURL = Aspose::Cloud::Common::Utils.sign(urlFolder)
          #      response = RestClient.get(signedURL, :accept => 'application/json')
          #      result = JSON.parse(response.body)
          #      apps = Array.new(result['Files'].size)
          #
          #      for i in 0..result['Files'].size - 1
          #        apps[i] = AppFile.new
          #        apps[i].Name = result['Files'][i]['Name']
          #        apps[i].IsFolder = result['Files'][i]['IsFolder']
          #        apps[i].Size = result['Files'][i]['Size']
          #        apps[i].ModifiedDate = Aspose::Cloud::Common::Utils.parse_date(result['Files'][i]['ModifiedDate'])
          #      end
          #      return apps	 
        end

        def file_exists(filename, storage_type = 'Aspose', storage_name = '')
          begin

            raise('Filename cannot be empty') if filename.empty?

            str_uri = @str_uri_exist + filename
            str_uri += '?storage=' + storage_name unless storage_name.empty?

            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
            JSON.parse(response_stream)['FileExist']['IsExist']

          rescue Exception => e
            print e
          end
        end

        def delete_file(filename, storage_type = 'Aspose', storage_name = '')
          begin

            raise 'File name cannot be empty' if filename.empty?

            str_uri = @str_uri_file + filename
            str_uri += '?storage=' + storage_name unless storage_name.empty?

            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.delete(signed_str_uri, {:accept => 'application/json'})

            stream_hash = JSON.parse(response_stream)
            stream_hash['Code'] == 200

          rescue Exception => e
            print e
          end
        end

        def create_folder (folder_name, storage_type = 'Aspose', storage_name='')
          begin
            raise 'Folder name cannot be empty' if folder_name.empty?
            folder_uri = URI.join(@str_uri_folder, folder_name)
            unless storage_name.empty?
              storage_query = URI.decode_www_form(folder_uri.query || []) << ["storage", storage_name] 
              folder_uri.query = URI.encode_www_form(storage_query)
            end
            signed_uri = Aspose::Cloud::Common::Utils.sign(folder_uri.to_s)
            response = RestClient.put(signed_uri, nil, :accept => :json)
            JSON.parse(response)['Code'] == 200

          rescue Exception => e
            print e
          end
        end

        def delete_folder (folder_name)
          begin

            raise 'Folder name cannot be empty' if folder_name.empty?

            str_uri = @str_uri_folder + folder_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri, :accept => 'application/json')
            JSON.parse(response)['Code'] == 200

          rescue Exception => e
            print e
          end
        end

        def get_disc_usage (storage_type = 'Aspose', storage_name = '')
          begin
            str_uri = @str_uri_disc
            str_uri += '?storage=' + storage_name unless storage_name.empty?

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            JSON.parse(response)['DiscUsage']

          rescue Exception => e
            print e
          end
        end

        # Get file from Aspose server
        def get_file (file_name, storage_type = 'Aspose', storage_name = '')
          begin

            raise 'Filename cannot be empty' if file_name.empty?

            str_uri = @str_uri_file + file_name
            str_uri += '?storage=' + storage_name unless storage_name.empty?

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            RestClient.get(signed_uri, :accept => 'application/json')

          rescue Exception => e
            print e
          end
        end

      end #Class Ends Here
    end
  end
end
