class Team < ActiveRecord::Base
	belongs_to :game
	has_one :controller, :class_name => "Player"

	validates_associated :controller
	validates_presence_of :name
end
