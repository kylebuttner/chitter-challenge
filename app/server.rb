class Chitter < Sinatra::Base

  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :partial_underscores

  get '/' do
    'Hello chitter! Welcome, Mike!'
  end

end
