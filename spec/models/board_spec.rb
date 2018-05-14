require 'rails_helper'

RSpec.describe Board, type: :model do
  it "is valid with a name and user id" do
  	board = Board.new(name: "My board", user_id: "2")
  	expect(board).to be_valid
  end

  it "is invalid without a name" do
  	board = Board.new(name: nil)
  	board.valid?
  	expect(board.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a user_id" do
  	board = Board.new(user_id: nil)
  	board.valid?
  	expect(board.errors[:user_id]).to include("can't be blank")
  end

  it "does not allow a duplicate board title by the same user" do
  	user = User.create(
  	  username: "daniel", 
  	  email: "daniel@mac.com", 
  	  password: "password"
  	)
  	user.boards.create(name: "My board", user_id: "2")
  	new_board = user.boards.build(name: "My board", user_id: "2")
  	new_board.valid?
  	expect(new_board.errors[:name]).to include("has already been taken")
  end

end