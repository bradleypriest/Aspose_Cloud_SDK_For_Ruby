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
    module OCR
      class Extractor
        def extract_text(*args)
          case args.size
          when 2
            image_file_name,folder = *args
              str_uri = ''
              if(folder=='' || folder==nil)
                str_uri += Aspose::Cloud::Common::Product.product_uri + '/ocr/' + image_file_name.to_s + '/recognize'
              else
                str_uri += Aspose::Cloud::Common::Product.product_uri + '/ocr/' + image_file_name.to_s + '/recognize?folder=' + folder.to_s
              end
          
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

              response = RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json
          when 4
            image_file_name,folder,language,use_default_dictionaries = *args
              str_uri = ''
              if(folder=='' || folder==nil)
                str_uri += Aspose::Cloud::Common::Product.product_uri + '/ocr/' + image_file_name.to_s + '/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s
              else
                str_uri += Aspose::Cloud::Common::Product.product_uri + '/ocr/' + image_file_name.to_s + '/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s + '&folder=' + folder.to_s
              end
          
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
              response = RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json
          when 1
            image_file_name = args[0]
              str_uri = Aspose::Cloud::Common::Product.product_uri + '/ocr/'	+ image_file_name + '/recognize?useDefaultDictionaries=true'
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response = RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json
          when 8
            image_file_name, language , use_default_dictionaries, x , y, height, width, folder = *args
              str_uri = Aspose::Cloud::Common::Product.product_uri
              str_uri	+= '/ocr/'
              str_uri	+= image_file_name
              str_uri	+= '/recognize?language='
              str_uri	+= language
              str_uri	+= ((x >= 0 && y >= 0 && width > 0 && height > 0) ? '&rectX=' + x.to_s	+ '&rectY=' + y.to_s + '&rectWidth=' + width.to_s + '&rectHeight=' + height.to_s : '') 
              str_uri	+= '&useDefaultDictionaries='
              str_uri	+= ((use_default_dictionaries) ? 'true' : 'false')
              str_uri	+=((folder=='') ? '' : '&folder=' + folder)

              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

              response = RestClient.get(signed_uri, :accept=> 'application/json')
              json = JSON.parse(response)
              return json
          when 3
            stream,language,use_default_dictionaries = *args
              str_uri = Aspose::Cloud::Common::Product.product_uri + '/ocr/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s
              signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
              response = RestClient.post(signed_uri,stream, :accept=> 'application/json')
              json = JSON.parse(response)
              return json
          end
        end


        def extract_text_from_local_file(local_file,language,use_default_dictionaries)
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/ocr/recognize?language=' + language.to_s + '&useDefaultDictionaries=' + use_default_dictionaries.to_s
            file_stream = File.binread(local_file)
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,file_stream, :accept=> 'application/json')
            json = JSON.parse(response)
            return json
        end
        def extract_text_from_url(url,language,use_default_dictionaries)
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/ocr/recognize?url=' + url + '&language=' + language + '&useDefaultDictionaries=' + use_default_dictionaries
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,:accept => 'application/json')
            json=JSON.parse(response)
            return json
        end
      end
    end
  end
end