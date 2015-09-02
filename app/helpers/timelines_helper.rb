module TimelinesHelper
  def sort_events(events)
    events.sort_by { |e| e.time_instant.to_i }
  end
end
