require 'test_helper'

class PinsControllerTest < ActionController::TestCase

  def setup
  	@pin = Pin.create(title: "pin test", url: "www.pintest.com", text: "This is my pin test", slug: "pin-test", id: '1', category_id: "ruby")
  	@user = User.create(username: "john", email: "john@mail.com", password: "password")
  end	

#index
  test 'should get pins index' do
  	get :index
  	assert_response :success
  end

#new
  test 'should get pins new' do
  	session[:user_id] = @user.id
  	get :new
  	assert_response :success
  end	

#update

end