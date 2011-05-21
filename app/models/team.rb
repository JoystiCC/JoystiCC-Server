class Team < ActiveRecord::Base
	belongs_to :game
	has_one :controller, :class_name => "Player"
	has_many :players

	validates_associated :controller
	validates_presence_of :name

    validate :ensure_controller_exists
    validate :ensure_team_limit

    #Teams must have at least 1 player and no more than 4
    #We check for >= 2 and <= 5 because the controller counts as a player, and we don't want to include them
    def ensure_team_limit
    	errors.add(self, 'cannot have more than 4 or less than 1 player') unless self.players.count >= 2 and self.players.count <= 5
    end

	def ensure_controller_exists
    	errors.add(:controller,'must exist') unless self.controller
  	end
end
