class Player < ActiveRecord::Base
	belongs_to :team
	has_one :game, :through => :team

	validates_presence_of :username, :team, :game
	validates_associated :team, :game
end
