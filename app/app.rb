ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'

require './app/models/user.rb'

require_relative 'server'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
