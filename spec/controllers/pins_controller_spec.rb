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

end
