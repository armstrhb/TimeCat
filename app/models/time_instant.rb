class TimeInstant < ActiveRecord::Base
  belongs_to :universe

  def time_grouping
    universe.time_grouping
  end
end
