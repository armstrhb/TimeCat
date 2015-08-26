class Event < ActiveRecord::Base
  belongs_to :time_instant, foreign_key: 'time_instant_id'
  belongs_to :universe, foreign_key: 'universe_id'
  has_and_belongs_to_many :locations, join_table: 'event_locations', uniq: true

  validates :name, presence: true, length: { in: 2..255 }
  validates :description, length: { maximum: 255 }
  validates :time_instant, presence: true
  validates :universe, presence: true
end
