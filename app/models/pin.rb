class Pin < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	validates_presence_of :title, :url, :text, :category_id, :user_id
	validates_uniqueness_of :slug


end