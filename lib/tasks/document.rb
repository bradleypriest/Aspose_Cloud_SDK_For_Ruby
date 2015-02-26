module Aspose
  module Cloud
    module Tasks
      class Document
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/tasks/' + @filename
        end

=begin
 Retrieve Project Properties
=end
        def get_properties(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/documentProperties"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Properties']['List']
        end

=begin
 Retrieve Project Tasks
=end
        def get_tasks(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/tasks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Tasks']['TaskItem']
        end

=begin
 Retrieve Task Information
 @param number task_id The id of the Task.
=end
        def get_task(task_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'task_id not specified.' if task_id.nil?

          str_uri = "#{@base_uri}/tasks/#{task_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Task']
        end

=begin
  Add a Task to Project
  @param string task_name The name of the Task.
  @param number before_task_id The id of the task to insert the new task before.
=end
        def add_task(task_name, before_task_id,  folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'task_name not specified.' if task_name.nil?
          raise 'before_task_id not specified.' if before_task_id.nil?

          str_uri = "#{@base_uri}/tasks"
          qry = { :taskName => task_name, :beforeTaskId => before_task_id }
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)

          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          JSON.parse(RestClient.post(signed_str_uri, '', {:accept=>'application/json'}))['TaskItem']
        end

=begin
  Delete a Task from Project
  @param number task_id The id of the Task.
=end
        def delete_task(task_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'task_id not specified.' if task_id.nil?

          str_uri = "#{@base_uri}/tasks/#{task_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          json = JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
          json['Code'] == 200 ? true : false
        end

=begin
  Retrieve Task Links Information from a Project
=end
        def get_links(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/taskLinks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['TaskLinks']
        end

=begin
  Delete a Task from Project
  @param number link_index The index of the Link.
=end
        def delete_link(link_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'link_index not specified.' if link_index.nil?

          str_uri = "#{@base_uri}/taskLinks/#{link_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          json = JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
          json['Code'] == 200 ? true : false
        end

=begin
  Get all Outline Codes from Project
=end
        def get_outline_codes(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/outlineCodes"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['OutlineCodes']
        end

        def get_outline_code(outline_code_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'outline_code_id not specified.' if outline_code_id.nil?

          str_uri = "#{@base_uri}/outlineCodes/#{outline_code_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['OutlineCode']
        end

=begin
  Delete a Outline Code from a Project
=end
        def delete_outline_code(outline_code_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'outline_code_id not specified.' if outline_code_id.nil?

          str_uri = "#{@base_uri}/outlineCodes/#{outline_code_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          json = JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
          json['Code'] == 200 ? true : false
        end

=begin
  Get all Extended Attributes from a Project
=end
        def get_extended_attributes(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/extendedAttributes"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['ExtendedAttributes']
        end

=begin
  Get a Particular Extended Attribute from a Project
  @param number attribute_id The id of the attribute.
=end
        def get_extended_attribute(attribute_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'attribute_id not specified.' if attribute_id.nil?

          str_uri = "#{@base_uri}/extendedAttributes/#{attribute_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['ExtendedAttribute']
        end

=begin
  Delete a Extended Attribute from a Project
  @param number attribute_id The id of the attribute.
=end
        def delete_extended_attribute(attribute_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'attribute_id not specified.' if attribute_id.nil?

          str_uri = "#{@base_uri}/extendedAttributes/#{attribute_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          json = JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
          json['Code'] == 200 ? true : false
        end
      end
    end
  end
end