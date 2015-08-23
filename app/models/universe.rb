class Universe < ActiveRecord::Base
  has_many :time_instants
  has_one :time_grouping, foreign_key: "universe_id"
end
