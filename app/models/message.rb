class Message
	include Mongoid::Document

	field :text, type: String
	field :created_at, type: Time
	belongs_to :user
	belongs_to :chat

	def text_with_user_name
	end
end