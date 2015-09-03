module TimelinesHelper
  def sort_events(events)
    return events if events == nil or events.length == 0
    events.sort_by { |e| e.time_instant.to_i }
  end
end
