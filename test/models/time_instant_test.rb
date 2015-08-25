require 'test_helper'

class TimeInstantTest < ActiveSupport::TestCase
  test "time_grouping property is universe's time_grouping" do
    ti = time_instants(:ww2_start_time)

    assert_not_nil ti.time_grouping, "time_grouping property does not exist"
    assert_equal ti.time_grouping, TimeGrouping.where(:universe => ti.universe).first, "time_grouping property not equal to universe's"
  end
end
