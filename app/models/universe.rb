class Universe < ActiveRecord::Base
  has_many :time_instants
  has_one :time_grouping, foreign_key: "universe_id"

  validates :name, presence: true, uniqueness: true, length: { in: 2..100 }
  validates :description, length: { maximum: 255 }
end
