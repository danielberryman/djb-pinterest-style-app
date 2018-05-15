class User < ActiveRecord::Base
	has_many :pinnings
	has_many :pins, through: :pinnings, dependent: :destroy
	has_many :boards, dependent: :destroy
	has_many :followers, dependent: :destroy
	before_save {self.email = email.downcase}

	validates_presence_of :username, :email, :password_digest
	validates_uniqueness_of :email
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	has_secure_password

	def followed
		Follower.where("follower_id=?", self.id)
	end

	def not_followed
		User.all - self.followed - [self]
	end
end