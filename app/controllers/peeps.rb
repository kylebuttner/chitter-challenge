class Chitter < Sinatra::Base

  post '/peep' do
    user = current_user
    Peep.create(user: user, peep: params[:new_peep])
    redirect '/'
  end

end
