class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		if @message.save!
			Pusher.trigger('messages', 'new_message',@message.text_with_user_name)
			render :json => "", :code => :ok
	end

	private

	def message_params
	end
end