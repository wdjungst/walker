class Walker < Sinatra::Application
  get '/' do
    haml :index
  end
end
