require 'sinatra/base'
require_relative '../../../lib/app/model/gymmies'
require_relative '../model/render_engine'

class ClubController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, File.expand_path(File.join(__FILE__, '..', '..', 'views'))



  # Home page
  get '/' do
    erb :index
  end

  get '/gymmies' do
    catalog = Gymmies.new
    @content = RenderEngine.render_gymmies(catalog.gymmies_catalog)
    erb :gymmies
  end

  # Groups management page
  get '/groups' do
    erb :groups
  end


  # Groups management page
  get '/groups/:id' do
    @groupId = params['id']
    erb :members
  end

  get '/members/:id' do

  end




  # start the server if ruby file executed directly
  run! if app_file == $0

end