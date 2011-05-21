class Game < ActiveRecord::Base
	has_many :teams
	belongs_to :owner, :class_name => "Player"

	validates_presence_of :password, :name
	validates_associated :owner, :teams
	
  	def to_json(options={})
    	options[:except] ||= [:password, :access_key]
    	super(options)
  	end

	def to_xml(options={})
    	options[:except] ||= [:password, :access_key]
    	super(options)
  	end
end
