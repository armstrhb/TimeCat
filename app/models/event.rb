class Event < ActiveRecord::Base
  belongs_to :time_instant, foreign_key: 'time_instant_id'
  belongs_to :universe, foreign_key: 'universe_id'
  belongs_to :part_of, class_name: 'Event', foreign_key: 'part_of_id'
  has_and_belongs_to_many :locations, join_table: 'event_locations', uniq: true
  has_and_belongs_to_many :people, join_table: 'event_people', uniq: true

  validates :name, presence: true, length: { in: 2..255 }
  validates :description, length: { maximum: 65536 }
  validates :time_instant, presence: true
  validates :universe, presence: true
end
