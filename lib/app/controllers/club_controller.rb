require 'sinatra/base'
require 'json'
require_relative '../../../lib/app/model/gymmie/gymmies'
require_relative '../model/render_engine'
require_relative '../model/manager'
require_relative '../model/group'
require_relative '../model/gymmie/gymmie_database'
require_relative '../model/gymmie/gymmie_info'

class ClubController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, File.expand_path(File.join(__FILE__, '..', '..', 'views'))

  attr_accessor :gymmies_database, :manager

  def initialize

    @manager = Manager.new("HOSEMA")
    super
  end

  # Home page
  get '/' do
    erb :index
  end

  # Groups management page
  get '/groups' do
    @content = RenderEngine.render_groups(@manager.groups)
    erb :groups
  end

  # Groups members page
  get '/groups/:id' do
    @groupId = params['id']
    @content = RenderEngine.render_members(@manager.group(@groupId).members)
    erb :members
  end

  post '/groups' do
    group_name = params[:group_name]
    if (manager.contains_group(group_name)) then 'Naam van groep bestaat al!'
    else
      @manager.add_group(group_name)
      redirect '/groups'
    end
  end

  # Show member details and gymmies
  get '/members/:id' do

  end


  # Gymmies information (general)
  get '/gymmies' do
    catalog = Gymmies.new
    @content = RenderEngine.render_gymmies(catalog.gymmies_catalog)
    erb :gymmies
  end

  get '/gymmies/:id' do
    id = params['id']
    gymmie = @gymmies_database.find(id)
    RenderEngine.render_gymmie_details(gymmie)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end