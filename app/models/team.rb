class Team < ActiveRecord::Base
	belongs_to :game
	belongs_to :leader, :class_name => "Player"
	has_many :players
	has_many :playerscores

	validates_associated :leader
	validates_presence_of :name

    validate :ensure_leader_exists
    validate :ensure_game_exists

	def ensure_leader_exists
    	errors.add(:leader,'must exist') unless self.leader
  	end

	def ensure_game_exists
    	errors.add(:game,'must exist') unless self.game
  	end

  	def to_json(options={})
    	options[:except] ||= [:password, :access_key]
    	super(options)
  	end

	def to_xml(options={})
    	options[:except] ||= [:password, :access_key]
    	super(options)
  	end
end
