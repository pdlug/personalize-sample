class User
  include Mongoid::Document

  field :name, type: String
  field :username, type: String
  field :password, type: String
  field :email, type: String

  validates_presence_of :username
end
