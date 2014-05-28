# Copyright (c) Aspose 2002-2014. All Rights Reserved.
#
# LICENSE: This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://opensource.org/licenses/gpl-3.0.html>;.
#
# @package Aspose_Cloud_SDK_For_Ruby
# @author  Assad Mahmood Qazi <assad.mahmood@aspose.com>
# @link    https://github.com/asposeforcloud/Aspose_Cloud_SDK_For_Ruby/tree/revamp

module Aspose
  module Cloud
    module AsposeStorage
      # This class provides functionality to manage files in a Remote Aspose Folder
      class Folder

        def initialize
          @str_uri_folder = Aspose::Cloud::Common::Product.product_uri + '/storage/folder/'
          @str_uri_file = Aspose::Cloud::Common::Product.product_uri + '/storage/file/'
          @str_uri_exist = Aspose::Cloud::Common::Product.product_uri + '/storage/exist/'
          @str_uri_disc = Aspose::Cloud::Common::Product.product_uri + '/storage/disc/'
        end

        # Uploads file from the local path to the remote folder.
        # * :localFilePath represents full local file path and name
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.		 
        def upload_file(local_file, remote_folder='', storage_type='Aspose', storage_name='')
          raise 'Local file not specified' if local_file.empty?

          filename = File.basename(local_file)
          str_uri = "#{ Aspose::Cloud::Common::Product.product_uri }/storage/file/#{ remote_folder + '/' unless remote_folder.empty? }#{ filename }"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

          signeduri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = JSON.parse(Aspose::Cloud::Common::Utils.upload_file_binary(local_file, signeduri))
          response['Status'].eql? 'OK'
        end


        # Retrieves Files and Folder information from a remote folder. The method returns an Array of AppFile objects.
        # * :remoteFolderPath represents remote folder relative to the root. Pass empty string for the root folder.
        def get_files(remote_folder_path='', storage_type='Aspose', storage_name='')
          str_uri = @str_uri_folder + remote_folder_path
          str_uri = str_uri[0..-2] if str_uri[-1].eql? '/'
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

          signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          response = RestClient.get(signed_uri, :accept => 'application/json')

          JSON.parse(response)['Files']
        end

        # check if a file exists on the storage
        def file_exists(filename, storage_type = 'Aspose', storage_name = '')
            raise('Filename cannot be empty') if filename.empty?

            str_uri = @str_uri_exist + filename
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.get(signed_str_uri, {:accept => 'application/json'})
            JSON.parse(response_stream)['FileExist']['IsExist']
        end

        def delete_file(filename, storage_type = 'Aspose', storage_name = '')
            raise 'File name cannot be empty' if filename.empty?

            str_uri = @str_uri_file + filename
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.delete(signed_str_uri, {:accept => 'application/json'})
            JSON.parse(response_stream)['Code'].eql? 200
        end

        def create_folder (folder_name, storage_type = 'Aspose', storage_name='')
            raise 'Folder name cannot be empty' if folder_name.empty?
            str_uri = @str_uri_folder + folder_name
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri, '', :accept => :json)
            JSON.parse(response)['Code'].eql? 200
        end

        def delete_folder (folder_name, storage_type = 'Aspose', storage_name='')
            raise 'Folder name cannot be empty' if folder_name.empty?
            str_uri = @str_uri_folder + folder_name
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri, :accept => 'application/json')
            JSON.parse(response)['Code'].eql? 200
        end

        def get_disc_usage (storage_type = 'Aspose', storage_name = '')
            str_uri = @str_uri_disc
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            JSON.parse(response)['DiscUsage']
        end

        # Get file from storage
        def get_file (file_name, storage_type = 'Aspose', storage_name = '')
            raise 'Filename cannot be empty' if file_name.empty?

            str_uri = @str_uri_file + file_name
            str_uri += append_storage(storage_name) unless storage_type.eql? 'Aspose'
            str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,'',storage_name,storage_type)

            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            RestClient.get(signed_uri, :accept => 'application/json')
        end
      end #Class Ends Here
    end
  end
end
