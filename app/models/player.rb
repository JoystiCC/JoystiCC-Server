class Player < ActiveRecord::Base
	belongs_to :team
	has_one :game, :through => :team
	has_many :playerscores

	validates_presence_of :username
    validate :ensure_team_exists

	def ensure_team_exists
    	errors.add(:team,'must exist') unless self.team
  	end
end
