require 'test_helper'

class EraTest < ActiveSupport::TestCase
  test "name must be present, and acceptable length" do
    assert_not Era.new(abbreviation: "ABC", universe: universes(:lotr), sequence: 100).save, "saved without name"
    assert_not Era.new(abbreviation: "ABC", universe: universes(:lotr), sequence: 100, name: "M").save, "saved with short name"
    assert Era.new(abbreviation: "ABC", universe: universes(:lotr), sequence: 100, name: "M" * 2).save, "save failed with 2 length name"
    assert Era.new(abbreviation: "DEF", universe: universes(:lotr), sequence: 101, name: "M" * 100).save, "save failed with 100 length name"
    assert_not Era.new(abbreviation: "GHI", universe: universes(:lotr), sequence: 102, name: "M" * 101).save, "saved with long name"
  end

  test "abbreviation must be present, and acceptable length" do
    assert_not Era.new(universe: universes(:lotr), sequence: 100, name: "Seventh Age").save, "saved without abbreviation"
    assert Era.new(abbreviation: "A", universe: universes(:lotr), sequence: 100, name: "Seventh Age").save, "save failed with 1 length abbreviation"
    assert Era.new(abbreviation: "A" * 10, universe: universes(:lotr), sequence: 101, name: "Eighth Age").save, "save failed with 10 length abbreviation"
    assert_not Era.new(abbreviation: "A" * 11, universe: universes(:lotr), sequence: 102, name: "Ninth Age").save, "saved with long abbreviation"
  end

  test "description must be less than 255 characters" do
    assert Era.new(abbreviation: "A", universe: universes(:lotr), sequence: 100, name: "Seventh Age").save, "save failed without description"
    assert Era.new(abbreviation: "B", universe: universes(:lotr), sequence: 101, name: "Eighth Age", description: "N" * 255).save, "save failed with description"
    assert_not Era.new(abbreviation: "C", universe: universes(:lotr), sequence: 102, name: "Ninth Age", description: "N" * 256).save, "saved with long description"
  end

  test "universe must be present" do
    assert_not Era.new(abbreviation: "A", sequence: 100, name: "Seventh Age").save, "saved without universe"
    assert Era.new(abbreviation: "A", sequence: 100, name: "Seventh Age", universe: universes(:lotr)).save, "save failed with universe"
  end

  test "sequence must be present" do
    assert_not Era.new(abbreviation: "A", universe: universes(:lotr), name: "Seventh Age").save, "saved without sequence"
    assert Era.new(sequence: 100, abbreviation: "A", universe: universes(:lotr), name: "Seventh Age").save, "save with sequence failed"
  end

  test "sequence must be a positive integer" do
    era = Era.new(abbreviation: "A", universe: universes(:lotr), name: "Seventh Age")

    era.sequence = 0
    assert_not era.save, "saved when sequence is zero"

    era.sequence = -1
    assert_not era.save, "saved when sequence is negative"

    era.sequence = 4.5
    assert_not era.save, "saved with non-integer"

    era.sequence = 12
    assert era.save, "save failed with positive integer"
  end

  test "sequence must be unique to the universe" do
    Era.create(sequence: 100, abbreviation: "ABC", universe: universes(:lotr), name: "Seventh Age")

    assert_not Era.new(sequence: 100, abbreviation: "DEF", universe: universes(:lotr), name: "Eight Age").save, "duplicate sequence saved"
    assert Era.new(sequence: 101, abbreviation: "DEF", universe: universes(:lotr), name: "Eight Age").save, "unique sequence save failed"
  end
end
