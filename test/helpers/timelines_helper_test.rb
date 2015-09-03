class TimelinesHelperTest < ActionView::TestCase
  include TimelinesHelper

  test "sort should sort by time instants" do
    events = universes(:lotr).events
    events = sort_events(events)

    previous_time_instant = nil

    events.each do |event|
      if previous_time_instant == nil
        next
      end

      assert_operator event.time_instant.to_i, :>=, previous_time_instant.to_i
      previous_time_instant = event.time_instant
    end
  end

  test "sort returns if input is nil" do
    assert_nil sort_events(nil)
  end
end
