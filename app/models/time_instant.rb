class TimeInstant < ActiveRecord::Base
  belongs_to :universe
  belongs_to :era
  has_many :events

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

  def formatted
    template = universe.time_grouping.format

    formatted_ts = fill_format(template, slot_1, "[S1]")
    formatted_ts = fill_format(formatted_ts, slot_2, "[S2]")
    formatted_ts = fill_format(formatted_ts, slot_3, "[S3]")
    formatted_ts = fill_format(formatted_ts, slot_4, "[S4]")
    formatted_ts = fill_format(formatted_ts, slot_5, "[S5]")
    formatted_ts = fill_format(formatted_ts, slot_6, "[S6]")
    formatted_ts = fill_format(formatted_ts, slot_7, "[S7]")
    formatted_ts = fill_format(formatted_ts, slot_8, "[S8]")
    formatted_ts = fill_format(formatted_ts, era.abbreviation, "[E]")

    formatted_ts
  end

  private
    def format_slot(slot)
      sprintf("%012d", (slot == nil ? 0 : slot))
    end

    def fill_format(string, slot, pattern)
      if slot != nil
        return string.gsub pattern, slot.to_s
      else
        return string
      end
    end
end
