require 'bcrypt'

class User
  include DataMapper::Resource
  # use Rack::MethodOverride

  property :id,     Serial
  property :username, Text, unique: true
  property :name,   Text
  property :email,  Text, unique: true
  property :password_digest, Text
  # property :password, Text
  # property :password_confirmation, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
