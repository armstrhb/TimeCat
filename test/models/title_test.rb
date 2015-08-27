require 'test_helper'

class TitleTest < ActiveSupport::TestCase
  test "name must be present" do
    assert_not Title.new(person: people(:person_boromir)).save, "title saved without name"
    assert Title.new(name: "Blah", person: people(:person_boromir)).save, "title save failed with name"
  end

  test "person must be present" do
    assert_not Title.new(name: "Blah").save, "title saved without person"
    assert Title.new(name: "Blah", person: people(:person_boromir)).save, "title save failed with person"
  end

  test "name must be of acceptable length" do
    assert_not Title.new(person: people(:person_boromir), name: "a").save, "title saved with short name"
    assert Title.new(person: people(:person_boromir), name: "aa").save, "title save failed with length 2 name"
    assert Title.new(person: people(:person_boromir), name: "a" * 255).save, "title save failed with length 255 name"
    assert_not Title.new(person: people(:person_boromir), name: "a" * 256).save, "title saved with long name"
  end
end
