# To change this template, choose Tools | Templates
# and open the template in the editor.
module Aspose
  module Cloud

    module Pdf
      class Document       
    
        def initialize(filename)
          @filename = filename
        end
    
        def get_page_count

      
            if(@filename == '')
              raise('Filename cannot be empty.')
            end
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/pages'
            signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(signed_str_uri,{:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Pages']['List'].count

        end
    
        def append_document(base_pdf, new_pdf, startpage = 0, endpage = 0, sourcefolder = '')
      

        
            if base_pdf == ''
              raise('Base file not specified')
            end
        
            if new_pdf == ''
              raise('File to merge is not specified')
            end       
        
            if sourcefolder == ''
              struri = "#{Aspose::Cloud::Common::Product.product_uri}/pdf/#{base_pdf}/appenddocument?appendfile=#{new_pdf}"+(startpage > 0 ? '&startPage=' + startpage.to_str : '' )  + (endpage > 0 ? '&endPage=' + endpage : '' )          
            else
              struri = "#{Aspose::Cloud::Common::Product.product_uri}/pdf/#{base_pdf}/appenddocument?appendfile=#{sourcefolder}/#{new_pdf}"+ (startpage > 0 ? '&startPage=' + startpage.to_str : '' )  + (endpage > 0 ? '&endPage=' + endpage : '' )
            end
        
            signeduri = Aspose::Cloud::Common::Utils.sign(struri)
                
            response_stream = RestClient.post signeduri,'', {:accept => 'application/json'}
                
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
              if(sourcefolder == '')
                output_stream = folder.get_file(base_pdf)
              else
                output_stream = folder.get_file(sourcefolder + '/' + base_pdf)
              end
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + base_pdf;
          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end
        end

        def merge_documents(source_files)

            _mergedfilename = @filename
      
            # Throw exception if output filename not specified
            if _mergedfilename == ''
              raise('Output file not specified')        
            end
      
            # Throw exception if source files are not provided
            if source_files.empty? || source_files.length < 2
              raise('File to merge are not specified')        
            end
      
            # Build JSON to post
            json_data = JSON.generate('List'=>source_files)
        
            struri = "#{Aspose::Cloud::Common::Product.product_uri}/pdf/#{_mergedfilename}/merge"
      
            signeduri = Aspose::Cloud::Common::Utils.sign(struri)
        
            responsexml = RestClient.put signeduri, json_data, {:content_type => :json}
           
      
            xmldoc = REXML::Document.new(responsexml)
      
            if xmldoc.elements.to_a('SaaSposeResponse/Status').first.text == 'OK'
              return true
            else
              return false
            end
        

        end
    
        #Gets the FormField count of the specified PDF document
    
        def get_form_field_count

            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/feilds'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
                
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Fields']['List'].count

        end
    
        #Gets the list of FormFields from the specified PDF document
    
        def get_form_fields

        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/feilds'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)        
        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
                
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Fields']['List']
        

        end
    
        # Gets a particular form field
        # field_name
    
        def get_form_field(field_name)
      

            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/feilds/' + field_name
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri) 
        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
                
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['Field']
      
        end
    
        #Creates a PDF from HTML
        #@param string $pdfFileName (name of the PDF file to create)
        #@param string $htmlFileName (name of the HTML template file)
    
        def create_from_html (pdf_filename, html_filename)
      

        
            if(pdf_filename == '')
              raise('PDF file name not specified.')
            end
        
            if(html_filename == '')
              raise('HTML file name not specified.')
            end
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + pdf_filename + '?templatefile=' + html_filename + '&templatetype=html'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.put(str_signed_uri, '', {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(pdf_filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + pdf_filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end

      
        end           
    
        #Creates a PDF from XML
        #@param string $pdfFileName (name of the PDF file to create)
        #@param string $xsltFileName (name of the XSLT template file)
        #@param string $xmlFileName (name of the XML file)
	    
        def create_from_xml (pdf_filename, xslt_filename, xml_filename)
      

        
            if(pdf_filename == '')
              raise('PDF file name not specified.')
            end
        
            if(xslt_filename == '')
              raise('XSLT file name not specified.')
            end
        
            if(xml_filename == '')
              raise('XML file name not specified.')
            end        
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + pdf_filename + '?templatefile=' + xslt_filename + '&datafile=' + xml_filename + '&templatetype=xml'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.put(str_signed_uri, '', {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(pdf_filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + pdf_filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end

      
        end
    
        #Creates an Empty Pdf document
        #@param string $pdfFileName (name of the PDF file to create)	  
	    
        def create_empty_pdf (pdf_filename)
      

        
            if(pdf_filename == '')
              raise('PDF file name not specified.')
            end
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + pdf_filename
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.put(str_signed_uri, '', {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(pdf_filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + pdf_filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end

      
        end
    
        #Add new page to opend pdf file	  
	    
        def add_new_page
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/pages'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.put(str_signed_uri, '', {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(@filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + @filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end
      
        end
    
        #Deletes selected page from Pdf document
        #@param page_number
	    
        def delete_page (page_number)
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            if(page_number == '')
              raise('page number not specified.')
            end
        
        
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
                
            response_stream = RestClient.delete(str_signed_uri, {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(@filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + @filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end

      
        end

        #Moves selected page in Pdf document to new location
        #@param page_number
        #@param new_location
	    
        def move_page (page_number, new_location)
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            if(page_number == '')
              raise('page number not specified.')
            end
        
            if(new_location == '')
              raise('new location not specified.')
            end
        
        
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/movepage?newindex=' + new_location.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
                       
            response_stream = RestClient.post(str_signed_uri, '', {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(@filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + @filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end

      
        end
    
        #Replaces Image in PDF File using Local Image Stream
        #@param page_number
        #@param image_index
        #@param image_stream
	    
        def replace_image_stream (page_number, image_index, image_stream)
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            if(page_number == '')
              raise('page number not specified.')
            end
        
            if(image_index == '')
              raise('image index not specified.')
            end
        
            if(image_stream == '')
              raise('image stream not specified.')
            end
        
        
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/images/' + image_index.to_s
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
                       
            response_stream = RestClient.post(str_signed_uri, image_stream, {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(@filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + @filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end

        end
    
        #Replaces Image in PDF File using Local Image Stream
        #@param page_number
        #@param image_index
        #@param image_filename
	    
        def replace_image_file (page_number, image_index, image_filename)
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            if(page_number == '')
              raise('page number not specified.')
            end
        
            if(image_index == '')
              raise('image index not specified.')
            end
        
            if(image_filename == '')
              raise('image filename not specified.')
            end
        
        
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/pages/' + page_number.to_s + '/images/' + image_index.to_s + '/imagefile=' + image_filename
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
   
            response_stream = RestClient.post(str_signed_uri, '', {:accept=>'application/json'})
        
            valid_output = Aspose::Cloud::Common::Utils.validate_output(response_stream)
        
            if valid_output == ''
              folder = Aspose::Cloud::AsposeStorage::Folder.new 
          
              output_stream = folder.get_file(@filename)          
              output_path = Aspose::Cloud::Common::AsposeApp.output_location + @filename;          
              Aspose::Cloud::Common::Utils.save_file(output_stream,output_path)
              return ''
            else
              return valid_output
            end
        

        end
    
        #Get specified properity of the document
        #@param string propertyName
       
        def get_document_property property_name
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            if(property_name == '')
              raise('property name not specified.')
            end
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/documentProperties/' + property_name
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.get(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['DocumentProperty']        
        

      
        end
    
        #Get specified properity of the document   
       
        def get_document_properties
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
        
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/documentProperties'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
       
            response_stream = RestClient.get(str_signed_uri,  {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
            return stream_hash['DocumentProperties']['List']
        

      
        end
    
        #Set specified properity of the document
        #@param string propertyName
        #@param string propertyValue
       
        def set_document_property property_name, property_value
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end
        
            if(property_name == '')
              raise('property name not specified.')
            end
        
            if(property_value == '')
              raise('property value not specified.')
            end
        
            # Build JSON to post
            json_data = JSON.generate('Value'=>property_value)

            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/documentProperties/' + property_name
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

            response_stream = RestClient.put(str_signed_uri, json_data, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            return stream_hash['DocumentProperty']        

      
        end
    
        #Remove All properties of a document    
       
        def remove_all_properties
      

        
            if(@filename == '')
              raise('PDF file name not specified.')
            end                                       
        
            str_uri = Aspose::Cloud::Common::Product.product_uri + '/pdf/' + @filename + '/documentProperties/'
            str_signed_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
        
            response_stream = RestClient.delete(str_signed_uri, {:accept=>'application/json'})
        
            stream_hash = JSON.parse(response_stream)
        
            if stream_hash['Code'] == 200
              return true;
            else
              return false;
            end
        

      
        end
    
      end
    end
    
  end
end