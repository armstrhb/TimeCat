require 'test_helper'

class UniverseTest < ActiveSupport::TestCase
  test "universe name must be unique" do
    uni = universes(:lotr)
    assert_not Universe.new(:name => uni.name).save, "universe saved with duplicate name"
    assert Universe.new(:name => uni.name + "1234").save, "universe failed to save with unique name"
  end

  test "universe name must be present" do
    assert_not Universe.new.save, "universe saved with nil name"
    assert_not Universe.new(name: "").save, "universe saved with empty name"
    assert Universe.new(name: "blueberry cobbler").save, "universe failed to save with name"
  end

  test "description must be less than 255 characters" do
    assert Universe.new(name: "test_uni1", description: "k").save, "universe save failed with 1 length description"
    assert Universe.new(name: "test_uni2", description: ("k" * 255)).save, "universe save failed with 255 length description"
    assert_not Universe.new(name: "test_uni3", description: ("k" * 256)).save, "universe saved with long description"
  end

  test "description allowed to be empty" do
    assert Universe.new(name: "test_uni1").save, "universe failed to save with nil description"
    assert Universe.new(name: "test_uni2", description: "").save, "universe failed to save with empty description"
  end

  test "time_grouping property exists and is accurate" do
    assert_not_nil universes(:lotr).time_grouping, "time_grouping property does not exist"
    assert_equal universes(:lotr).time_grouping, time_groupings(:lotr_time_grouping), "lotr.time_grouping not equal to lotr_time_grouping"
  end
end
