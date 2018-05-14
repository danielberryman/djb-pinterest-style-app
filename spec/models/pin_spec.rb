require 'rails_helper'

RSpec.describe Pin, type: :model  do
	
  it "is valid with a title, url, text, category, user, & slug" do
  	pin = Pin.new(
  	  title: "My new pin",
  	  url: "https://www.google.com",
  	  text: "Lorem ipsum this is a test.",
  	  category_id: "1",
  	  user_id: "2",
  	  slug: "ruby-dash"
  	)
  	expect(pin).to be_valid
  end

  it "is invalid if without title" do
  	pin = Pin.new(title: nil)
  	pin.valid?
  	expect(pin.errors[:title]).to include("can't be blank")
  end

  it "is invalid if without url" do
  	pin = Pin.new(url: nil)
  	pin.valid?
  	expect(pin.errors[:url]).to include("can't be blank")
  end

  it "is invalid if without text" do
  	pin = Pin.new(text: nil)
  	pin.valid?
  	expect(pin.errors[:text]).to include("can't be blank")
  end

  it "is invalid if without category_id" do
  	pin = Pin.new(category_id: nil)
  	pin.valid?
  	expect(pin.errors[:category_id]).to include("can't be blank")
  end

  it "is invalid if without user_id" do
  	pin = Pin.new(user_id: nil)
  	pin.valid?
  	expect(pin.errors[:user_id]).to include("can't be blank")
  end

  it "is invalid if without slug" do
  	pin = Pin.new(slug: nil)
  	pin.valid?
  	expect(pin.errors[:slug]).to include("can't be blank")
  end

  it "is invalid if duplicate slug" do
  	pin = Pin.create(
  	  title: "My new pin",
  	  url: "https://www.google.com",
  	  text: "Lorem ipsum this is a test.",
  	  category_id: "1",
  	  user_id: "2",
  	  slug: "ruby-dash"
  	)
  	pin = Pin.new(
  	  title: "My new pin",
  	  url: "https://www.google.com",
  	  text: "Lorem ipsum this is a test.",
  	  category_id: "1",
  	  user_id: "2",
  	  slug: "ruby-dash"
  	)
  	pin.valid?
  	expect(pin.errors[:slug]).to include("has already been taken")
  end

end










