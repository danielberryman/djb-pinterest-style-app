require 'spec_helper'

class CreatePinsController < ActionDispatch::IntegrationTest

	def setup
	  @user = User.create(username: "john", email: "john@mail.com", password: "password")
	end

	describe 'GET new and create article' do
	  sign_in_as(@user, "password")
	  get :new
	  expect(response.success?).to be(true)
	end

end