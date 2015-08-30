require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "name must be present" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))

    assert_not Event.new(universe: lotr, time_instant: timestamp).save, "Event saved without name"
    assert Event.new(name: "Latte", universe: lotr, time_instant: timestamp).save, "Event saved without name"
  end

  test "name must be of length between 2 and 255" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))

    assert_not Event.new(name: "k", universe: lotr, time_instant: timestamp).save, "Event saved with short name"
    assert_not Event.new(name: "k" * 256, universe: lotr, time_instant: timestamp).save, "Event saved with long name"
    assert Event.new(name: "k" * 255, universe: lotr, time_instant: timestamp).save, "Event saved name with length 255"
  end

  test "description must be less than 256 length" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))

    assert_not Event.new(name: "Coffee", universe: lotr, time_instant: timestamp, description: "k" * 256).save, "Description allowed with long length"
    assert Event.new(name: "Coffee", universe: lotr, time_instant: timestamp, description: "k" * 255).save, "Description allowed with valid length"
  end

  test "time_instant must be present" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))

    assert_not Event.new(name: "Espresso", universe: lotr).save, "time_instant missing but saved"
    assert Event.new(name: "Espresso", universe: lotr, time_instant: timestamp).save, "time_instant failed to save when present"
  end

  test "universe must be present" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))

    assert_not Event.new(name: "Hazelnut", time_instant: timestamp).save, "universe missing but saved"
    assert Event.new(name: "Hazelnut", universe: lotr, time_instant: timestamp).save, "universe failed to save when present"
  end
end
