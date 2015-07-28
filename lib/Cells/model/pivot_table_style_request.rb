require 'json'

module Aspose
	module Cloud
		module Cells
			class PivotTableStyleRequest
				attr_accessor :font
				attr_accessor :name
				attr_accessor :culture_custom
				attr_accessor :custom
				attr_accessor :background_color
				attr_accessor :foreground_color
				attr_accessor :is_formula_hidden
				attr_accessor :is_date_time
				attr_accessor :is_text_wrapped
				attr_accessor :is_gradient
				attr_accessor :is_locked
				attr_accessor :is_percent
				attr_accessor :shrink_to_fit
				attr_accessor :indent_level
				attr_accessor :number
				attr_accessor :rotation_angle
				attr_accessor :pattern
				attr_accessor :text_direction
				attr_accessor :vertical_alignment
				attr_accessor :horizontal_alignment
				attr_accessor :border_collection
				attr_accessor :link

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