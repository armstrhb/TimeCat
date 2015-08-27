class TimeGrouping < ActiveRecord::Base
  belongs_to :universe

  validates :universe, presence: true, uniqueness: true
end
