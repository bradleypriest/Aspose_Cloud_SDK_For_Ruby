module Aspose
  module Cloud
    module Cells
      class Worksheet
        def initialize(filename, worksheet_name)
          @filename = filename
          @worksheet_name = worksheet_name
          raise 'filename not specified.' if filename.empty?
          raise 'worksheet_name not specified.' if worksheet_name.empty?
          @base_uri = "#{Aspose::Cloud::Common::Product.product_uri}/cells/#{@filename}/worksheets/#{@worksheet_name}"
        end

        def get_cells_list(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Cells']['CellList']
        end

        def get_row_list(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells/rows"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Rows']['RowsList']
        end

        def get_columns_list(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells/columns"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Columns']['ColumnsList']
        end

        def get_max_columns(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Cells']['MaxColumn']
        end

        def get_max_row(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Cells']['MaxRow']
        end

        def get_cells_count(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Cells']['CellCount']
        end

        def get_auto_shapes_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/autoshapes"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['AutoShapes']['AuotShapeList'].length
        end

        def get_auto_shapes_by_index(shape_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/autoshapes/#{shape_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['AutoShapes']
        end

        def get_cell(cell_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'cell_name not specified.' if cell_name.empty?

          str_uri = "#{@base_uri}/cells/#{cell_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Cell']
        end

        def get_cell_style(cell_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'cell_name not specified.' if cell_name.empty?

          str_uri = "#{@base_uri}/cells/#{cell_name}/style"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Style']
        end

        def set_cell_style(cell_name, style, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'cell_name not specified.' if cell_name.empty?
          raise 'style not specified.' if style.empty?

          str_uri = "#{@base_uri}/cells/#{cell_name}/style"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, style.to_json, { :content_type => :json, :accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def get_chart_by_index(chart_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'chart_index not specified.' if chart_index.nil?

          str_uri = "#{@base_uri}/charts/#{chart_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Chart']
        end

        def get_hyperlink_by_index(link_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'link_index not specified.' if link_index.nil?

          str_uri = "#{@base_uri}/hyperlinks/#{link_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Hyperlink']
        end

        def get_comment(cell_name, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'cell_name not specified.' if cell_name.empty?

          str_uri = "#{@base_uri}/comments/#{cell_name}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Comment']
        end

        def get_oleobject_by_index(ole_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'ole_index not specified.' if ole_index.nil?

          str_uri = "#{@base_uri}/oleobjects/#{ole_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['OleObject']
        end

        def get_picture_by_index(image_index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'image_index not specified.' if image_index.nil?

          str_uri = "#{@base_uri}/pictures/#{image_index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Picture']
        end

        def get_validation_by_index(index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'index not specified.' if index.nil?

          str_uri = "#{@base_uri}/validations/#{index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Validation']
        end

        def get_mergedcell_by_index(index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'index not specified.' if index.nil?

          str_uri = "#{@base_uri}/mergedCells/#{index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['MergedCell']
        end

        def get_mergedcells_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/mergedCells"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['MergedCell']['Count']
        end

        def get_validations_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/validations"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Validations']['Count']
        end

        def get_pictures_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/pictures"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Pictures']['PictureList'].length
        end

        def get_oleobjects_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/oleobjects"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['OleObjects']['OleOjectList'].length
        end

        def get_charts_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/oleobjects"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Charts']['ChartList'].length
        end

        def get_comments_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/comments"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Comments']['CommentList'].length
        end

        def get_hyperlinks_count(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/hyperlinks"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Hyperlinks']['HyperlinkList'].length
        end

        def hide_worksheet(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/visible?isVisible=false"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, '', {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def unhide_worksheet(folder_name = '', storage_type = 'Aspose', storage_name = '')
          str_uri = "#{@base_uri}/visible?isVisible=true"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, '', {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def get_rows_count(offset, count, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'offset not specified.' if offset.nil?
          raise 'count not specified.' if count.nil?

          str_uri = "#{@base_uri}/cells/rows"
          qry = { :offset => offset, :count => count}
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Rows']['RowsCount']
        end

        def get_row(index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'index not specified.' if index.nil?

          str_uri = "#{@base_uri}/cells/rows/#{index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Row']
        end

        def delete_row(index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'index not specified.' if index.nil?

          str_uri = "#{@base_uri}/cells/rows/#{index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.delete(signed_str_uri, {:accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def sort_data(data_sort, cell_area, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'data_sort not specified.' if data_sort.nil?
          raise 'cell_area not specified.' if cell_area.nil?

          str_uri = "#{@base_uri}/sort"
          qry = { :CellArea => cell_area }

          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, data_sort.to_json, { :content_type => :json, :accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def get_column(index, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'index not specified.' if index.nil?

          str_uri = "#{@base_uri}/cells/columns/#{index}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Column']
        end


        def move_worksheet(position, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'position not specified.' if position.nil?

          json_data = { :DestinationWorksheet => @worksheet_name, :Position => position }
          str_uri = "#{@base_uri}/position"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, json_data, { :content_type => :json, :accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def calculate_formula(formula, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'formula not specified.' if formula.empty?

          str_uri = "#{@base_uri}/formulaResult?formula=#{formula}"
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.get(signed_str_uri, {:accept=>'application/json'}))['Value']
        end

        def set_cell_value(cell_name, value_type, value, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'cell_name not specified.' if cell_name.empty?
          raise 'value_type not specified.' if value_type.empty?
          raise 'value not specified.' if value.empty?

          str_uri = "#{@base_uri}/cells/#{cell_name}"
          qry = { :value => value, :type => value_type }
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.post(signed_str_uri, '', { :accept=>'application/json'}))['Code'] == 200 ? true : false
        end

        def add_picture(picture_path, upper_left_row, upper_left_column, lower_right_row, lower_right_column, folder_name = '', storage_type = 'Aspose', storage_name = '')
          raise 'picture_file not specified.' if picture_path.empty?
          raise 'upper_left_row not specified.' if upper_left_row.empty?
          raise 'upper_left_column not specified.' if upper_left_column.empty?
          raise 'lower_right_row not specified.' if lower_right_row.empty?
          raise 'lower_right_column not specified.' if lower_right_column.empty?

          qry = { :upperLeftRow => upper_left_row, :upperLeftColumn => upper_left_column, :lowerRightRow => lower_right_row,
          :lowerRightColumn => lower_right_column, :picturePath => picture_path}
          str_uri = "#{@base_uri}/pictures"
          str_uri = Aspose::Cloud::Common::Utils.build_uri(str_uri,qry)
          str_uri = Aspose::Cloud::Common::Utils.append_storage(str_uri,folder_name,storage_name,storage_type)
          signed_str_uri = Aspose::Cloud::Common::Utils.sign(str_uri)
          JSON.parse(RestClient.put(signed_str_uri, '', { :accept=>'application/json'}))['Code'] == 200 ? true : false
        end
      end
    end
  end
end