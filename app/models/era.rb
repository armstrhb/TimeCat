class Era < ActiveRecord::Base
  belongs_to :universe, foreign_key: 'universe_id'
  has_many :time_instants, foreign_key: 'era_id'
  has_many :events, through: :time_instants

  validates :name, presence: true, length: { in: 2..100 }
  validates :abbreviation, presence: true, length: { in: 1..10 }
  validates :description, length: { maximum: 255 }
  validates :universe, presence: true

  validates :sequence, presence: true
  validates_numericality_of :sequence, only_integer: true, greater_than: 0
  validates_uniqueness_of :sequence, scope: :universe

  validates :length, presence: true
  validates_numericality_of :length, only_integer: true, greater_than_or_equal_to: -1

  def present?
    length == -1
  end
end
