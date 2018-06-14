class PostsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # INDEX
  get '/' do
    "hello world"
  end

  # NEW
  get '/new' do
    "new page"
  end

  # SHOW
  get '/:id' do

    id = params[:id].to_i

    "Show page #{ :id }"
  end

  # CREATE
  post '/' do
    "create something new"
  end

  # EDIT
  get '/:id/edit' do
    "Edit page #{ :id }"
  end

  # UPDATE
  put '/:id' do
    "Update me "
  end

  # DESTROY
  delete '/:id' do
    "Delete me"
  end

end
