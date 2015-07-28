require 'json'

module Aspose
	module Cloud
		module Cells
			class CreatePivotTableRequest
				attr_accessor :name
				attr_accessor :source_data
				attr_accessor :dest_cell_name
				attr_accessor :use_same_source
				attr_accessor :pivot_field_rows
				attr_accessor :pivot_field_columns
				attr_accessor :pivot_field_data

				def initialize; end

				def to_json
					hash = self.instance_variables.each_with_object({}) { 
						|var, hash| hash[ snake_case_to_camel_case(var.to_s.delete("@")) ] = self.instance_variable_get(var) 
					}
					hash.to_json
				end

				def snake_case_to_camel_case(var_name)
					name_parts = var_name.split("_")
					name_parts.map! { |name| name.capitalize }
					name_parts.join
				end
			end
		end
	end
end