require 'test_helper'

class TimelinesControllerTest < ActionController::TestCase
  test "/timeline should give you a list of universes (index action)" do
    assert_routing '/timelines', { controller: 'timelines', action: 'index' }
  end

  test "/timeline/:name should map to universe:show for that universe" do
    assert_routing '/timelines/lotr', { controller: 'timelines', action: 'show', name: 'lotr'}
  end
end
