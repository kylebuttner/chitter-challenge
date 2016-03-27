require 'sinatra/base'
require 'sinatra/partial'
require 'data_mapper'

require './app/models/user.rb'

class Chitter < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    'Hello chitter! Welcome, Mike!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(name: params[:name],
          username: params[:username], email: params[:email],
          password: params[:password],
          password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
