class Pin < ActiveRecord::Base
	has_many :users, through: :pinnings
	has_many :pinnings
	belongs_to :category
	belongs_to :user

	# for paperclip gem
  	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "http://placebear.com/300/300"
    validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	validates_presence_of :title, :url, :text, :category_id, :user_id
	validates_uniqueness_of :slug
end