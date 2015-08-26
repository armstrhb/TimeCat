class TimeInstant < ActiveRecord::Base
  belongs_to :universe

  validates :universe, presence: true
  validates :slot_1, presence: true

  def time_grouping
    universe.time_grouping
  end
end
