module TimelinesHelper
  def sort_events(events)
    return events if events == nil or events.length == 0
    events.sort_by { |e| e.time_instant.to_i }
  end

  def sort_eras(eras)
    return eras if eras == nil or eras.length == 0
    eras.sort_by { |e| e.sequence }
  end

  def format_time_instant(time_instant)
  end
end
