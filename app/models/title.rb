class Title < ActiveRecord::Base
  belongs_to :person

  validates :person, presence: true
  validates :name, presence: true, length: { in: 2..255 }
end
