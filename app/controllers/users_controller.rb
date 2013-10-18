class UsersController < ApplicationController
	before_action :registrant_get
	#gets the registrant before anything else
	

	def new
		#bind a user object to the new user form
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@registrant = Registrant.find(session[:registrant_id])
		@user.email = @registrant.email
		if @user.save
			session[:user_id] = @user.id #stores the user id in the session hash- it bypasses the session controller 
			@registrant.destroy

			redirect_to chats_url
		else
			flash[:alert] = 'Uh oh!'
			render :new
		end
	end

	def edit
		# @registrant = Registrant_find_by(code: params)
	end

	private

	def registrant_get
		id = session[:registrant_id] #(params)in this context, sessions means it stores data from between browser pages
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end

end
