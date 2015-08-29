class Person < ActiveRecord::Base
  belongs_to :universe, foreign_key: 'universe_id'
  belongs_to :birth_instant, class_name: 'TimeInstant', foreign_key: 'birth_instant_id'
  belongs_to :death_instant, class_name: 'TimeInstant', foreign_key: 'death_instant_id'
  belongs_to :birth_location, class_name: 'Location', foreign_key: 'birth_location_id'
  belongs_to :residence_location, class_name: 'Location', foreign_key: 'residence_location_id'
  belongs_to :death_location, class_name: 'Location', foreign_key: 'death_location_id'
  has_and_belongs_to_many :events, join_table: 'event_people', uniq: true
  has_many :titles, foreign_key: 'person_id'

  validates :name, presence: true, length: { in: 1..255 }
  validates_uniqueness_of :name, scope: :universe
  validates :universe, presence: true
end
