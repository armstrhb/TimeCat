require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  test "name must be present and of proper length" do
    uni = universes(:lotr)

    assert_not Location.new(universe: uni).save, "location saved without name"
    assert_not Location.new(name: "a", universe: uni).save, "location saved with short name"
    assert_not Location.new(name: "a" * 256, universe: uni).save, "location saved with long name"
    assert Location.new(name: "a" * 255, universe: uni).save, "location save failed with 255 char name"
    assert Location.new(name: "a" * 2, universe: uni).save, "location save failed with 2 char name"
  end

  test "universe must be present" do
    uni = universes(:lotr)

    assert_not Location.new(name: "Dale").save, "location saved without universe"
    assert Location.new(name: "Dale", universe: uni).save, "location save failed with universe present"
  end

  test "sub_locations contains children locations" do
    gondor = locations(:lotr_gondor)

    assert_not_nil gondor.sub_locations, "sub_locations property does not exist"
    assert_equal gondor.sub_locations, Location.where(:part_of => gondor), "sub_locations property not equal to listing"
  end
end
