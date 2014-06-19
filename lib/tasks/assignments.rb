module Aspose
  module Cloud
    module Tasks
      class Assignments
        def initialize(filename)
          @filename = filename
          raise 'filename not specified.' if filename.empty?
          @base_uri =  Aspose::Cloud::Common::Product.product_uri + '/tasks/' + @filename
        end

        def get_assignments(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/assignments"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Assignments']['AssignmentItem']
        end

        def get_assignment(assignment_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'assignment_id not specified.' if assignment_id.nil?

          str_uri = "#{@base_uri}/assignments/#{assignment_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Assignment']
        end

        def add_assignment(task_id, resource_id, units, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'task_id not specified.' if task_id.nil?
          raise 'resource_id not specified.' if resource_id.nil?
          raise 'units not specified.' if units.nil?

          str_uri = "#{@base_uri}/assignments"
          qry = { :taskUid => task_id, :resourceUid => resource_id, :units => units }
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)

          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)

          JSON.parse(RestClient.post(signed_str_uri, '', {:accept=>'application/json'}))['AssignmentItem']
        end

        def delete_assignment(assignment_id, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'assignment_id not specified.' if assignment_id.nil?

          str_uri = "#{@base_uri}/assignments/#{assignment_id}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
        end

      end
    end
  end
end