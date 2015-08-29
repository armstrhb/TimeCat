require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test "person must have a name" do
    assert_not Person.new(universe: universes(:lotr)).save, "person saved without name"
    assert Person.new(name: "Cappuccino", universe: universes(:lotr)).save, "person save failed with name"
  end

  test "person must belong to a universe" do
    assert_not Person.new(name: "Cappuccino").save, "person saved with no universe"
    assert Person.new(name: "Cappuccino", universe: universes(:lotr)).save, "person save failed with universe"
  end

  test "person's name must be valid (unique for universe and of proper length)" do
    boromir = people(:person_boromir)

    assert_not Person.new(name: boromir.name, universe: universes(:lotr)).save, "duplicate name saved"
    assert_not Person.new(name: "a" * 256, universe: universes(:lotr)).save, "long name accepted"
    assert Person.new(name: "a", universe: universes(:lotr)).save, "name of length 1 failed"
    assert Person.new(name: "a" * 255, universe: universes(:lotr)).save, "name of length 255 failed"

    assert Person.new(name: "Latte", universe: universes(:lotr)).save, "person save failed"
    assert_not Person.new(name: "Latte", universe: universes(:lotr)).save, "duplicate name in universe allowed"
    assert Person.new(name: "Latte", universe: universes(:ww2)).save, "universe unique name failed"
  end
end
