class Location < ActiveRecord::Base
  belongs_to :universe
  belongs_to :part_of, class_name: 'Location', foreign_key: 'part_of_id'
  has_many :sub_locations, class_name: 'Location', foreign_key: 'part_of_id'
  has_and_belongs_to_many :events, join_table: 'event_locations', uniq: true

  validates :name, presence: true, length: { in: 2..255 }
  validates :universe, presence: true
  validates :description, length: { maximum: 65536 }
end
