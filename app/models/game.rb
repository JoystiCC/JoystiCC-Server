class Game < ActiveRecord::Base
	has_many :teams
	has_one :owner, :class_name => "Player"
end
