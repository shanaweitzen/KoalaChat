class Chat
  include Mongoid::Document

  field :first_name, type: String
  field :last_name, type: String

  has_and_belongs_to_many :Users
  has_many :Messages
  
end