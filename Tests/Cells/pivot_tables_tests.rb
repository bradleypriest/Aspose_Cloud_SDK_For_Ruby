require 'test/unit'
require_relative '../../lib/asposecloud'

class PivotTablesTests < Test::Unit::TestCase

  def setup
    file = File.read('../setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end

  def test_get_worksheet_pivot_tables_info
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')
    response = pivot_table_obj.get_worksheet_pivot_tables_info
    assert_instance_of(Hash, response)
  end 

  def test_add_a_pivot_table_into_worksheet
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')
    
    createPivotTableRequest = Aspose::Cloud::Cells::CreatePivotTableRequest.new
    createPivotTableRequest.name = "SalePivotTable"
    createPivotTableRequest.source_data = "A1:F214"
    createPivotTableRequest.dest_cell_name = "A1"
    createPivotTableRequest.use_same_source = true
    createPivotTableRequest.pivot_field_rows = [1]
    createPivotTableRequest.pivot_field_columns = [1]
    createPivotTableRequest.pivot_field_data = [1]

    response = pivot_table_obj.add_a_pivot_table_into_worksheet(createPivotTableRequest)
    assert_instance_of(Hash, response)
  end

  def test_delete_worksheet_pivot_tables
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')
    response = pivot_table_obj.delete_worksheet_pivot_tables
    assert_instance_of(Hash, response)
  end

  def test_get_worksheet_pivot_table_info_by_index
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')
    response = pivot_table_obj.get_worksheet_pivot_table_info_by_index(0)
    assert_instance_of(Hash, response)
  end

  def test_add_pivot_field_into_pivot_table
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')
    
    pivot_table_field_request = Aspose::Cloud::Cells::PivotTableFieldRequest.new
    pivot_table_field_request.data = [1, 2]

    pivot_table_obj.add_pivot_field_into_pivot_table(1, "Row", pivot_table_field_request)
    assert_instance_of(Hash, response)
  end

  def test_delete_worksheet_pivot_table_by_index
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')
    response = pivot_table_obj.delete_worksheet_pivot_table_by_index(0)
    assert_instance_of(Hash, response)
  end

  def test_update_cell_style_for_pivot_table
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')

   pivot_table_style_request = Aspose::Cloud::Cells::PivotTableStyleRequest.new
    pivot_table_style_request.is_gradient = true
    pivot_table_style_request.font = Font.new
    pivot_table_style_request.font.is_bold = true

    response = pivot_table_obj.update_cell_style_for_pivot_table(0, 1, 1, pivot_table_style_request)
    assert_instance_of(Hash, response)
  end

  def test_update_style_for_pivot_table
    pivot_table_obj = Aspose::Cloud::Cells::PivotTable.new('pivot-tables.xls', 'Sheet4')

    pivot_table_style_request = Aspose::Cloud::Cells::PivotTableStyleRequest.new
    pivot_table_style_request.is_gradient = true
    pivot_table_style_request.font = Aspose::Cloud::Cells::Font.new
    pivot_table_style_request.font.is_bold = true

    response = pivot_table_obj.update_style_for_pivot_table(0, pivot_table_style_request)
    assert_instance_of(Hash, response)
  end

end