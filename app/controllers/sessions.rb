class Chitter < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      # flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end
  #
  # post '/users' do
  #   user = User.new(name: params[:name],
  #         username: params[:username], email: params[:email],
  #         password: params[:password],
  #         password_confirmation: params[:password_confirmation])
  #   if user.save
  #     session[user_id] = user.id
  #     redirect '/'
  #   else
  #     redirect '/users/new'
  #   end
  # end
end
