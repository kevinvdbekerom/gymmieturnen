require 'sinatra/base'
require_relative '../../../lib/app/model/gymmies'
require_relative '../model/render_engine'
require_relative '../model/gymmie_database'
require_relative '../model/gymmie_info'

class ClubController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, File.expand_path(File.join(__FILE__, '..', '..', 'views'))

  attr_accessor :gymmies_database

  def initialize
    @gymmies_database = GymmieDatabase.new()
    gymmie_example = GymmieInfo.new('arabier1',
                                    ['benen bij elkaar', 'voeten raken bank niet', 'handen plat op de bank'],
                                    'Door middel van wendsprongen over een bank gaan.')
    @gymmies_database.add_gymmie(gymmie_example)
    super
  end

  # Home page
  get '/' do
    erb :index
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

  # Groups management page
  get '/groups' do
    erb :groups
  end


  # Groups members page
  get '/groups/:id' do
    @groupId = params['id']
    erb :members
  end

  get '/members/:id' do

  end




  # start the server if ruby file executed directly
  run! if app_file == $0

end