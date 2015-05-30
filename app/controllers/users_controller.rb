class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
	end

	def edit
		@user = User.find(params[:id])
	end
	
	def create
		@user = User.new(user_params)
		if @user.save
			session[:user] = @user.id
			flash[:notice] = "Tu usuario se ha creado."
			redirect_to @user
		else
			render "new"
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render "edit"
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session[:user] = nil
		redirect_to users_path
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end