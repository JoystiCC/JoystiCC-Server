class Player < ActiveRecord::Base
	belongs_to :team
	has_one :game, :through => :team
	has_many :playerscores

	validates_presence_of :username
    validate :ensure_team_exists
  	def create
    	self.access_key = ActiveSupport::SecureRandom.hex(32)
    	super
  	end
	def ensure_team_exists
    	errors.add(:team,'must exist') unless self.team_id.nil? || self.team
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
