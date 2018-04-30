require 'spec_helper'

RSpec.describe PinsController do

  # you will decsribe what your app does when you send a get request to your index method
  describe "GET index" do

    it 'renders the index template' do
      get :index
      # expect(actual).to matcher(expected)
      # expect(actual).not_to matcher(expected)
      expect(response).to render_template("index")
      # there will be a response and we expect it render template index
    end

    it 'populates @pins with all pins' do
      get :index
      expect(assigns[:pins]).to eq(Pin.all)

    end

  end

  describe "GET new" do
    it 'responds with successfully' do
      get :new
      expect(response.success?).to be(true)
    end
    
    it 'renders the new view' do
      get :new
      expect(response).to render_template(:new)
    end
    
    it 'assigns an instance variable to a new pin' do
      get :new
      expect(assigns(:pin)).to be_a_new(Pin)
    end
  end 

  describe "GET edit" do
    before(:each) do
      @pin = { 
            title: 'Rails Tutorial', 
          url: 'https://www.railstutorial.org/', 
          text: "The trusted standard in self-directed introductions to Ruby on Rails. A complete treatment of all the essentials required in most production Rails applications.", 
          slug: "rails-tutorial",
          category_id: "rails",
        id: '2'}    
    end

    # responds successfully
    it 'responds with successfully' do
      get :edit, pin: @pin_id
      expect(response.success?).to be(true)
    end
    # renders the edit template
    
    #assigns an instance variable called @pin to the Pin with the appropriate id
    
  end


end
