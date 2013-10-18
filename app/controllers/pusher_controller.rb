class PusherController < ApplicationController
	protect_from_forgery :except => :auth

	def auth
		#For pusher client authentication - AJAX
		channel_name = params[:channel_name]
		socket_id = params[:socket_id].to_s

		#To make sure the player is registered for the contest
		user_id = params[:uid]
		chat_id = params[:cid]
		user = User.find_by(id: player_id)

		#make sure these are converted to strings (** not Moped::BSON::ObjectId)
		chats = user.chats.distinct(:id).join(" ").split(" ")
			if chats.include? chats_id.to_s
			response = Pusher[channel_name].authenticate(
				socket_id,
				{
					user_id: user_id,
					user_info: {
						first_name: user.first_name,
						last_name: user.last_name
					}
				}
			) 
		render json: response
		else
			render text: "Unauthorized User", status: '403'
		end
	end
end