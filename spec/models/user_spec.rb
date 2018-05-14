require 'rails_helper'

RSpec.describe User, type: :model  do
  it "is valid with username, email, and password" do
  	user = User.new(username: "daniel9", email: "daniel@mac.com", password: "password")
  	expect(user).to be_valid
  end

  it "is invalid without a username" do
  	user = User.new(username: nil)
  	user.valid?
  	expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a email" do
  	user = User.new(email: nil) 
  	user.valid?
  	expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid if email is duplicate" do
  	user = User.create(username: "Daniel", email: "daniel@mail.com", password: "password")
  	user = User.new(username: "Grace", email: "daniel@mail.com", password: "admin")
  	expect(user).to_not be_valid
  end

  it "is invalid if email incorrect format" do
  	user = User.new(username: "Daniel", email: "daniel@mailcom", password: "password")
  	expect(user).to_not be_valid
  end

  it "is invalid without a password" do
  	user = User.new(username: "Daniel", email: "daniel@mail.com", password: "")
  	expect(user).to_not be_valid
  end

end