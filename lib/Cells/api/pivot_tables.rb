module Aspose
	module Cloud
		module Cells
			class PivotTable
				def initialize(filename, worksheet_name)
					raise 'Filename is not specified.' if filename.nil? || filename.empty?
					raise 'Worksheet name is not specified.' if filename.nil? || filename.empty?
					@filename = filename
					@worksheet_name = worksheet_name
					@base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/cells/#{@filename}/worksheets/#{@worksheet_name}"
				end

				def get_worksheet_pivot_tables_info
					#build URL
					str_uri = "#{@base_uri}/pivottables"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))
				end

				def add_a_pivot_table_into_worksheet(create_pivot_table_request)
					request_json_string = create_pivot_table_request.to_json
					#build URL
					str_uri = "#{@base_uri}/pivottables"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.put(signed_str_uri, request_json_string, {"Content-Type"=>"application/json"}))
				end

				def delete_worksheet_pivot_tables
					#build URL
					str_uri = "#{@base_uri}/pivottables"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
				end

				def get_worksheet_pivot_table_info_by_index(pivot_table_index)
					#build URL
					str_uri = "#{@base_uri}/pivottables/#{pivotTableIndex}"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))
				end

				def add_pivot_field_into_pivot_table(pivot_table_index, pivot_field_type, pivot_table_field_request)
					request_json_string = pivot_table_field_request.to_json
					#build URL
					str_uri = "#{@base_uri}/pivottables/#{pivot_table_index}/PivotField?pivotFieldType=#{pivot_field_type}"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.put(signed_str_uri, request_json_string, {"Content-Type"=>"application/json"}))
				end

				def delete_worksheet_pivot_table_by_index(pivot_table_index)
					#build URL
					str_uri = "#{@base_uri}/pivottables/#{pivot_table_index}"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))
				end

				def update_cell_style_for_pivot_table(pivot_table_index, column, row, pivot_table_style_request)
					request_json_string = pivot_table_style_request.to_json
					#build URL
					str_uri = "#{@base_uri}/pivottables/#{pivot_table_index}/Format?column=#{column}&row=#{row}"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.post(signed_str_uri, request_json_string, {"Content-Type"=>"application/json"}))
				end

				def update_style_for_pivot_table(pivot_table_index, pivot_table_style_request)
					request_json_string = pivot_table_style_request.to_json
					#build URL
					str_uri = "#{@base_uri}/pivottables/#{pivot_table_index}/FormatAll"
					#sign URL
					signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
					JSON.parse(RestClient.post(signed_str_uri, request_json_string, {"Content-Type"=>"application/json"}))
				end
			end
		end
	end
end
