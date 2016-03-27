require 'bcrypt'

class User
  include DataMapper::Resource

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

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, 'postgres://localhost/chitter_test')
DataMapper.finalize
DataMapper.auto_upgrade!
