class Pin < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :title, :url, :text, :resource_type, :user_id
	validates_uniqueness_of :slug


end