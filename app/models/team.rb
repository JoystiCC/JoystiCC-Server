class Team < ActiveRecord::Base
	belongs_to :game
	has_one :controller, :class_name => "Player"
end
