class Chitter < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores
  enable :sessions

  get '/' do
    p @peeps = Peep.all
    erb :index
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
