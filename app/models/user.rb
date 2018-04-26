class User < ActiveRecord::Base
	has_many :pinnings
	has_many :pins, through: :pinnings, dependent: :destroy
	before_save {self.email = email.downcase}

	validates_presence_of :username, :email, :password_digest

	has_secure_password
end