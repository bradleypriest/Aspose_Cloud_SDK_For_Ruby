module Aspose
  module Cloud
    module Slides
      class Document
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/slides/' + @filename
        end

=begin
  Finds the slide count of the specified PowerPoint document
=end
        def get_slide_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/slides"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Slides']['SlideList'].length
        end

=begin
  Replaces all instances of old text with new text in a presentation or a particular slide
  @param string old_text
  @param string new_text
  @param number slide_number
=end    
        def replace_text(old_text, new_text, slide_number = 0, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'old_text not specified.' if old_text.empty?
          raise 'new_text not specified.' if new_text.empty?

          str_uri = "#{@base_uri}#{ slide_number > 0 ? '/slides/' + slide_number : '' }/replaceText"
          qry = Hash.new
          qry[:oldValue] = old_text
          qry[:newValue] = new_text
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.post(signed_str_uri,'',{:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end

=begin
  Gets all the text items in a slide or presentation
  @param number slide_number
  @param boolean with_empty
=end
        def get_all_text_items(slide_number=0, with_empty=false, folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}#{ slide_number > 0 ? '/slides/' + slide_number : '' }/textItems?withEmpty=#{with_empty}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['TextItems']['Items']
        end

=begin
  Deletes all slides from a presentation
=end
        def delete_all_slides(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/slides"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.delete(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          valid_output.empty? ? Aspose::Cloud::Common::Utils.download_file(@filename,@filename,folder_name,storage_name,storage_type) : valid_output
        end
    
=begin
   Get Document's properties
=end
        def get_properties(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DocumentProperties']['List']
        end

=begin
   Get Resource Properties information like document source format, IsEncrypted, IsSigned and document properties
   @param string property_name
=end
        def get_property(property_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['DocumentProperty']
        end

=begin
   Set document property
   @param string property_name
   @param string property_value
=end
        def set_property(property_name, property_value, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?
          raise 'property_value not specified.' if property_value.empty?

          json_data = JSON.generate('Value'=>property_value)

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'}))['DocumentProperty']
        end

=begin
   Remove All Document's properties
=end
        def remove_all_properties(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

=begin
   Delete a document property
   @param string property_name
=end
        def delete_property(property_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_name not specified.' if property_name.empty?

          str_uri = "#{@base_uri}/documentProperties/#{property_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

=begin
   Add custom document properties
   @param hash property_list  
=end
        def add_custom_property(property_list, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'property_list not specified.' if property_list.empty?

          json_data = property_list.to_json

          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, json_data, {:content_type=>:json, :accept=>'application/json'}))
        end

=begin
     saves the document into various formats    
     @param string outputFilename
     @param string outputFormat
=end
    
        def save_as(output_filename=@filename, output_format='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'output_filename not specified.' if output_filename.empty?
          raise 'output_format not specified.' if output_format.empty?

          str_uri = "#{@base_uri}?format=#{output_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}.#{output_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end
    
=begin
  saves the document into various formats         
  @param string slide_number
  @param string outputFilename
  @param string outputFormat
=end
        def save_slide_as(slide_number, output_filename=@filename, output_format='', folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'slide_number not specified.' if slide_number.nil?
          raise 'output_filename not specified.' if output_filename.empty?
          raise 'output_format not specified.' if output_format.empty?

          str_uri = "#{@base_uri}/slides/#{slide_number}?format=#{output_format}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          response_stream = RestClient.get(signed_str_uri, {:accept=>'application/json'})
          valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
          output_path = "#{Aspose::Cloud::Common::AsposeApp.output_location}#{Aspose::Cloud::Common::Utils.get_filename(output_filename)}_#{slide_number}.#{output_format}"
          valid_output.empty? ? Aspose::Cloud::Common::Utils.save_file(response_stream,output_path) : valid_output
        end
      end
    end
  end
end