class Game < ActiveRecord::Base
	has_many :teams
	has_one :owner, :class_name => "Player"

	validates_presence_of :password, :name
	validates_associated :owner, :teams
end
