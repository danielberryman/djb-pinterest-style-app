require 'rails_helper'

RSpec.describe Pinning, type: :model do
  it "does allow the a pinning duplicate on the same board by the same user" do
  	user = User.create(
  	  username: "daniel", 
  	  email: "daniel@mac.com", 
  	  password: "password"
  	)
  	board = user.boards.create(
  	  name: "My board"
  	)
  	expect(board).to be_valid
  	
  	#create 2 pinnings
  	user.pinnings.create (
  	  pin_id: "5",
  	  board_id: "2"
  	)

  	#assign each of those pinnings to the board I just created
  	#check to see if the second pinning's error message will include



  	# user.pinning.create(
  	#   user_id: "1",
  	#   pin_id: "5",
  	#   board_id: ""
  	# )
  	# new_pinning = user.pinning.build(
  	#   user_id: "1",
  	#   pin_id: "5",
  	#   board_id: "3"
  	# )
  end
end