class Team < ActiveRecord::Base
	belongs_to :game
	has_one :controller, :class_name => "Player"

	validates_associated :game
	validates_presence_of :name
	validates_associated :controller
end
