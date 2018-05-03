class PinsController < ApplicationController
	before_action :set_pin, only: [:edit, :update, :show, :destroy, :repin]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@pins = Pin.all
	end

	def new
		@pin = Pin.new
		@pin.user = current_user
	end

	def create
		@pin = Pin.new(pin_params)
		@pin.user = current_user
		if @pin.save
			flash[:success] = "You created a new pin!"
			redirect_to pin_path(@pin)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @pin.update(pin_params)
			flash[:success] = "Your pin was successfully updated"
			redirect_to pin_path(@pin)
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@pin.destroy
		flash[:notice] = "Pin was successfully deleted."
		redirect_to pins_path
	end

	def repin
		@pin.pinnings.create(user: current_user)
		redirect_to user_path(current_user)
	end

	private

	def set_pin
		@pin = Pin.find(params[:id])
	end

	def pin_params
		params.require(:pin).permit(:title, :category_id, :text, :url, :slug)
	end

	def require_same_user
	  if current_user != @pin.user
	    flash[:danger] = "You can only edit or delete your own profile"
	    redirect_to pins_path
	  end
	end

end