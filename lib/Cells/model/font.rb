require 'json'

module Aspose
	module Cloud
		module Cells
			class Font
				attr_accessor :name
				attr_accessor :size
				attr_accessor :color
				attr_accessor :double_size
				attr_accessor :is_bold
				attr_accessor :is_italic
				attr_accessor :is_subscript
				attr_accessor :is_strikeout	
				attr_accessor :is_superscript
				attr_accessor :underline

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