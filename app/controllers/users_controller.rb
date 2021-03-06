class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:new, :create, :show]
	before_action :require_same_user, only: [:edit, :update, :show, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:notice] = "Your account has been created successfully!"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was successfully updated"
			redirect_to users_path
		else
			render 'edit'
		end
	end

	def show
		@pins = current_user.pins
	end

	def destroy
		@user.destroy
		flash[:danger] = "User and all articles created by user have been deleted."
		session[:user_id] = nil
		redirect_to root_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:username, :email, :password, :avatar)
	end

	def require_same_user
	  if current_user != @user
	    flash[:danger] = "You can only edit or delete your own profile"
	    redirect_to users_path
	  end
	end

end