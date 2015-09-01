class TimeInstant < ActiveRecord::Base
  belongs_to :universe
  belongs_to :era

  validates :universe, presence: true
  validates :era, presence: true
  validates :slot_1, presence: true

  def time_grouping
    universe.time_grouping
  end

  def to_i
    val = era.sequence.to_s

    val += format_slot(slot_1)
    val += format_slot(slot_2)
    val += format_slot(slot_3)
    val += format_slot(slot_4)
    val += format_slot(slot_5)
    val += format_slot(slot_6)
    val += format_slot(slot_7)
    val += format_slot(slot_8)

    val.to_i
  end

  private
    def format_slot(slot)
      sprintf("%012d", (slot == nil ? 0 : slot))
    end
end
