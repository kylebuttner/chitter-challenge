class Chitter < Sinatra::Base

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
end
