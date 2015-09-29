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

  test "description must be less than 65537 length" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))

    assert_not Event.new(name: "Coffee", universe: lotr, time_instant: timestamp, description: "k" * 65537).save, "Description allowed with long length"
    assert Event.new(name: "Coffee", universe: lotr, time_instant: timestamp, description: "k" * 65536).save, "Description allowed with valid length"
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

  test "singular_time? property exists, identifies events with spans" do
    lotr = universes(:lotr)
    timestamp = TimeInstant.new(universe: lotr, slot_1: 1600, era: eras(:lotr_ta))
    event = Event.new(name: "Latte", time_instant: timestamp, universe: lotr)

    assert_not event.span?, "span? property returned true on single time instant"
    assert event.singular_time?, "singular_time? property returned false on singular time instant"

    end_timestamp = TimeInstant.new(universe: lotr, slot_1: 1601, era: eras(:lotr_ta))
    event.end_time_instant = end_timestamp

    assert event.span?, "span? property returned false on span event"
    assert_not event.singular_time?, "singular_Time? property returned true on span event"
  end
end
