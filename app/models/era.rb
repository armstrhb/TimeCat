class Era < ActiveRecord::Base
  belongs_to :universe, foreign_key: 'universe_id'

  validates :name, presence: true, length: { in: 2..100 }
  validates :abbreviation, presence: true, length: { in: 1..10 }
  validates :description, length: { maximum: 255 }
  validates :universe, presence: true

  validates :order, presence: true
  validates_numericality_of :order, only_integer: true, greater_than: 0
  validates_uniqueness_of :order, scope: :universe
end
