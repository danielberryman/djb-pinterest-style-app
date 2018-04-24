class PinsController < ApplicationController
	def index
		@pins = Pin.all
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.new(pin_params)
		@pin.user = User.first
		if @pin.save
			flash[:success] = "You created a new pin!"
			redirect_to pins_path
		else
			render 'new'
		end
	end

	def edit
		@pin = Pin.find(params[:id])
	end

	def update
		@pin = Pin.find(params[:id])
		if @pin.update(pin_params)
			flash[:success] = "Your pin was successfully updated"
			redirect_to pin_path(@pin)
		else
			render 'edit'
		end
	end

	def destroy
	end

	private

	def pin_params
		params.require(:pin).permit(:title, :resource_type, :text, :url, :slug)
	end

end