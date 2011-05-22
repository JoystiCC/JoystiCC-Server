class Team < ActiveRecord::Base
	belongs_to :game
	has_one :controller, :class_name => "Player"
	has_many :players
	has_many :playerscores

	validates_associated :controller
	validates_presence_of :name

    validate :ensure_controller_exists

	def ensure_controller_exists
    	errors.add(:controller,'must exist') unless self.controller
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
