require 'sinatra/base'

class ClubController < Sinatra::Application

  puts (settings.root + '/../views')

  set :root, File.dirname(__FILE__)
  set :views, "#{settings.root}/../views/*.erb"

  # Home page
  get '/' do
    erb :index
  end


  # start the server if ruby file executed directly
  run! if app_file == $0

end