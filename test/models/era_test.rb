require 'test_helper'

class EraTest < ActiveSupport::TestCase
  test "name must be present, and acceptable length" do
    assert_not Era.new(length: 1, abbreviation: "ABC", universe: universes(:lotr), sequence: 100).save, "saved without name"
    assert_not Era.new(length: 1, abbreviation: "ABC", universe: universes(:lotr), sequence: 100, name: "M").save, "saved with short name"
    assert Era.new(length: 1, abbreviation: "ABC", universe: universes(:lotr), sequence: 100, name: "M" * 2).save, "save failed with 2 length name"
    assert Era.new(length: 1, abbreviation: "DEF", universe: universes(:lotr), sequence: 101, name: "M" * 100).save, "save failed with 100 length name"
    assert_not Era.new(length: 1, abbreviation: "GHI", universe: universes(:lotr), sequence: 102, name: "M" * 101).save, "saved with long name"
  end

  test "abbreviation must be present, and acceptable length" do
    assert_not Era.new(length: 1, universe: universes(:lotr), sequence: 100, name: "Seventh Age").save, "saved without abbreviation"
    assert Era.new(length: 1, abbreviation: "A", universe: universes(:lotr), sequence: 100, name: "Seventh Age").save, "save failed with 1 length abbreviation"
    assert Era.new(length: 1, abbreviation: "A" * 10, universe: universes(:lotr), sequence: 101, name: "Eighth Age").save, "save failed with 10 length abbreviation"
    assert_not Era.new(length: 1, abbreviation: "A" * 11, universe: universes(:lotr), sequence: 102, name: "Ninth Age").save, "saved with long abbreviation"
  end

  test "description must be less than 65536 characters" do
    assert Era.new(length: 1, abbreviation: "A", universe: universes(:lotr), sequence: 100, name: "Seventh Age").save, "save failed without description"
    assert Era.new(length: 1, abbreviation: "B", universe: universes(:lotr), sequence: 101, name: "Eighth Age", description: "N" * 65536).save, "save failed with description"
    assert_not Era.new(length: 1, abbreviation: "C", universe: universes(:lotr), sequence: 102, name: "Ninth Age", description: "N" * 65537).save, "saved with long description"
  end

  test "universe must be present" do
    assert_not Era.new(length: 1, abbreviation: "A", sequence: 100, name: "Seventh Age").save, "saved without universe"
    assert Era.new(length: 1, abbreviation: "A", sequence: 100, name: "Seventh Age", universe: universes(:lotr)).save, "save failed with universe"
  end

  test "sequence must be present" do
    assert_not Era.new(length: 1, abbreviation: "A", universe: universes(:lotr), name: "Seventh Age").save, "saved without sequence"
    assert Era.new(length: 1, sequence: 100, abbreviation: "A", universe: universes(:lotr), name: "Seventh Age").save, "save with sequence failed"
  end

  test "sequence must be a positive integer" do
    era = Era.new(length: 1, abbreviation: "A", universe: universes(:lotr), name: "Seventh Age")

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
    Era.create(length: 1, sequence: 100, abbreviation: "ABC", universe: universes(:lotr), name: "Seventh Age")

    assert_not Era.new(length: 1, sequence: 100, abbreviation: "DEF", universe: universes(:lotr), name: "Eight Age").save, "duplicate sequence saved"
    assert Era.new(length: 1, sequence: 101, abbreviation: "DEF", universe: universes(:lotr), name: "Eight Age").save, "unique sequence save failed"
  end

  test "length must be present" do
    assert_not Era.new(abbreviation: "A", universe: universes(:lotr), name: "Seventh Age").save, "saved with no length"
    assert Era.new(length: 1, sequence: 12, abbreviation: "A", universe: universes(:lotr), name: "Seventh Age").save, "save failed with length present"
  end

  test "length must be an integer greater than or equal to -1" do
    era = Era.new(sequence: 12, abbreviation: "A", universe: universes(:lotr), name: "Seventh Age")

    era.length = -2
    assert_not era.save, "saved when length is less than -1"

    era.length = 4.5
    assert_not era.save, "saved with non-integer"

    era.length = 12
    assert era.save, "save failed with positive integer"

    era.length = -1
    assert era.save, "save failed when length is -1"
  end

  test "length of -1 means present age" do
    era = Era.new

    era.length = -1
    assert era.present?

    era.length = 1
    assert_not era.present?
  end
end
