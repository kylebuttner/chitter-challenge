ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'

require './app/models/user.rb'

require_relative 'server'
require_relative 'controllers/users'

class Chitter < Sinatra::Base
  # start the server if ruby file executed directly
  run! if app_file == $0
end
