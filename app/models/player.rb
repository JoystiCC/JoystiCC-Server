class Player < ActiveRecord::Base
	belongs_to :team
	has_one :game, :through => :team
	has_many :playerscores

	validates_presence_of :username
	validates_presence_of :access_key
    validate :ensure_team_exists

	def ensure_team_exists
    	errors.add(:team,'must exist') unless self.team
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
