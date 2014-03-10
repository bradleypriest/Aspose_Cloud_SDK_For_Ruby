module Aspose
  module Cloud
    module Cells
      class Workbook
        def initialize filename
          @filename = filename
        end
    
        def get_properties

            if @filename == ''
              raise 'Base file name not specified.'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/documentProperties'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            if json['Code'] == 200
              return json['DocumentProperties']['DocumentPropertyList']
            else
              return false
            end
        

      
        end
    
        def get_property property_name

            if @filename == ''
              raise 'Base file name not specified.'
            end
            if property_name == ''
              raise 'Property name is not specified.'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/documentProperties/' + property_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            if json['Code'] == 200
              return json['DocumentProperty']
            else
              return false
            end
        

      
        end
    
        def set_property property_name='',property_value=''

            if @filename == ''
              raise 'Base file name not specified.'
            end
            if property_name == ''
              raise 'Property name is not specified.'
            end
            if property_value == ''
              raise 'Property Value is not specified.'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/documentProperties/' + property_name
            put_data_arr = Hash.new
            put_data_arr['Link'] = nil
            put_data_arr['Name'] = property_name
            put_data_arr['Value'] = property_value
            put_data_arr['BuiltIn'] = 'False'
            json_data = put_data_arr.to_json
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri,json_data, :accept => 'application/json')
            json = JSON.parse(response)
            if json['Code'] == 200
              return json['DocumentProperty']
            else
              return false
            end
        

      
        end
        def remove_all_properties

            if @filename == ''
              raise 'Base file name not specified.'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/documentProperties'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri, :accept=>'application/json')
            json = JSON.parse(response)
            if json['Code'] == 200
              return true
            else
              return false
            end
        

      
        end
    
        def remove_property property_name

            if @filename == ''
              raise 'Base file name not specified.'
            end
            if property_name == ''
              raise 'Property name is not specified.'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/documentProperties/' + property_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            if json['Code'] == 200
              return true
            else
              return false
            end
        

      
        end
    
        def create_empty_workbook

            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri,'', :accept => 'application/json')
            json = JSON.parse(response)
            return json  

      
        end
    
        def create_workbook_from_template template_file_name

            if template_file_name == ''
              raise 'Template file not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '?templatefile=' + template_file_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri,'', :accept => 'application/json')
            json = JSON.parse(response)
            return json  

      
        end
    
        def create_workbook_from_smart_marker_template template_file_name ='',data_file=''

            if template_file_name == ''
              raise 'Template file not specified'
            end
            if data_file == ''
              raise 'Data file not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '?templatefile=' + template_file_name + '&dataFile=' + data_file
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri,'', :accept => 'application/json')
            json = JSON.parse(response)
            return json  

      
        end
    
        def process_smart_marker data_file=''

            if data_file == ''
              raise 'Data file not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/smartmarker?xmlFile=' + data_file
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,'', :accept => 'application/json')
            json = JSON.parse(response)
            return json  

      
        end
    
        def get_worksheets_count

            if @filename == ''
              raise 'Base file name not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/worksheets'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Worksheets']['WorksheetList'].size

        end
    
        def get_name_count

            if @filename == ''
              raise 'Base file name not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/names'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Names'].count

        end
    
        def get_default_style

            if @filename == ''
              raise 'Base file name not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/defaultStyle'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.get(signed_uri, :accept => 'application/json')
            json = JSON.parse(response)
            return json['Style']

        end
    
        def encrypt_workbook encryption_type='XOR',password='',key_length=''

            if @filename == ''
              raise 'Base file name not specified'
            end
            fields_array = Hash.new
            fields_array['EncriptionType'] = encryption_type
            fields_array['KeyLength'] = key_length
            fields_array['Password'] = password
            json_data = fields_array.to_json
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/encryption'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri, json_data,:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end
    
        def protect_workbook protection_type = 'all',password=''

            if @filename == ''
              raise 'Base file name not specified'
            end
            fields_array = Hash.new
            fields_array['ProtectionType'] = protection_type
            fields_array['Password'] = password
            json_data = fields_array.to_json
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/protection'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            
            response = Aspose::Cloud::Common::Utils.process_command(signed_uri,'POST','JSON',json_data)            
                        
            json = JSON.parse( response )
            if json['Code']==200
              return true
            else
              return false
            end

        end
    
        def unprotect_workbook password

            if @filename == ''
              raise 'Base file name not specified'
            end
            fields_array = Hash.new
            fields_array['Password'] = password
            json_data = fields_array.to_json
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/protection'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = Aspose::Cloud::Common::Utils.process_command(signed_uri,'DELETE','JSON',json_data)
            
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end

        def set_modify_password password=''

            if @filename == ''
              raise 'Base file name not specified'
            end
            fields_array = Hash.new
            fields_array['Password'] = password
            json_data = fields_array.to_json
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/writeProtection'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri, json_data,:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end 
    
        def clear_modify_password password=''

            if @filename == ''
              raise 'Base file name not specified'
            end
            fields_array = Hash.new
            fields_array['Password'] = password
            json_data = fields_array.to_json
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/writeProtection'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri,json_data, json_data,:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end 


        def decrypt_password password

            if @filename == ''
              raise 'Base file name not specified'
            end
            fields_array = Hash.new
            fields_array['Password'] = password
            json_data = fields_array.to_json
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/encryption'
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri,json_data,:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end 

        def add_worksheet worksheet_name=''

            if @filename == ''
              raise 'Base file name not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/worksheets/' + worksheet_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.put(signed_uri, '',:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==201
              return true
            else
              return false
            end

        end 
   
        def remove_worksheet worksheet_name=''

            if @filename == ''
              raise 'Base file name not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/worksheets/' + worksheet_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.delete(signed_uri,:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end
    
        def merge_workbook merge_file_name =''

            if @filename == ''
              raise 'Base file name not specified'
            end
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/cells/' + @filename + '/merge?mergeWith='  + merge_file_name
            signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
            response = RestClient.post(signed_uri,'',:accept => 'application/json')
            json = JSON.parse(response)
            if json['Code']==200
              return true
            else
              return false
            end

        end
   
      end
    end
    
  end
end