class PlayerScore < ActiveRecord::Base
  belongs_to :team
  belongs_to :player

  validates_numericality_of :points
end