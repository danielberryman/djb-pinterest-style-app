class User < ActiveRecord::Base
	has_many :pins
	before_save {self.email = email.downcase}

	validates_presence_of :username, :email, :password_digest 

	has_secure_password
end