
require 'test/unit'
require_relative '../../lib/asposecloud'

class CalendarTests < Test::Unit::TestCase

  def setup
    file = File.read('../setup.json')
    data = JSON.parse(file)

    Aspose::Cloud::Common::AsposeApp.app_key = data['app_key']
    Aspose::Cloud::Common::AsposeApp.app_sid = data['app_sid']
    Aspose::Cloud::Common::AsposeApp.output_location = data['output_location']
    Aspose::Cloud::Common::Product.set_base_product_uri(data['product_uri'])
  end

  # Get all Calendars from Project
  def test_get_calendars
    calendar = Aspose::Cloud::Tasks::Calendar.new('test_tasks.mpp')
    response = calendar.get_calendars()
    assert_instance_of(Array, response)
  end

  # Get a particular Calendar from Project
  def test_get_calendar
    calendar = Aspose::Cloud::Tasks::Calendar.new('test_tasks.mpp')
    response = calendar.get_calendar(calendar_id=5)
    assert_instance_of(Hash, response)
  end

  # Delete a Calendar from Project
  def test_delete_calendar
    calendar = Aspose::Cloud::Tasks::Calendar.new('test_tasks.mpp')
    response = calendar.delete_calendar(calendar_id=5)
    assert_equal true, response
  end  
end