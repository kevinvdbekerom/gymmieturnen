require 'sinatra'

class ClubController

  # Home page
  get '/' do
    erb :index
  end


end