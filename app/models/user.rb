class User 
	include Mongoid::Document
	attr_accessor :password
	before_save :encrypt_password
	validates_confirmation_of :password 
	validates_confirmation_of :email
	validates_uniqueness_of :email

	field :first_name, type: String
	field :last_name, type: String
	field :email, type: String
	field :salt, type: String
	field :fish, type: String
	
	has_and_belongs_to_many :Chats
	has_many :Messages

	def authenticate(password)
		self.fish = BCrypt::Engine.hash_secret(password, self.salt)
	end

	private 

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.fish = BCrypt::Engine.hash_secret(password, self.salt)
		end
	end
end