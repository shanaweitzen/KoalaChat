class Registrant
  include Mongoid::Document
 field :email, type: String
 field :code, type: String
 field :expires_at , type: DateTime
end