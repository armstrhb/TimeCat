require 'test_helper'

class TimeGroupingTest < ActiveSupport::TestCase
  test "grouping must reference universe" do
    assert_not TimeGrouping.new.save, "grouping saved without universe"

    uni = Universe.create(name: "test_uni2")
    assert TimeGrouping.new(universe: uni).save, "grouping save failed with universe"
  end

  test "only one grouping can exist for a universe" do
    grouping = time_groupings(:lotr_time_grouping)
    assert_not TimeGrouping.new(universe: grouping.universe).save, "grouping saved with duplicate universe"
  end
end
