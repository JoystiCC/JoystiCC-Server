class Game < ActiveRecord::Base
	has_many :teams
	belongs_to :owner, :class_name => "Player"

	validates_presence_of :password, :name
	validates_associated :owner, :teams
end
