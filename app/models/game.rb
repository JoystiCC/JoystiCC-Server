class Game < ActiveRecord::Base
	has_many :teams
	has_one :owner, :class_name => "Player"

	validates_presence_of :password
	validates_presence_of :name
	validates_associated :owner
	validates_associated :teams
end
