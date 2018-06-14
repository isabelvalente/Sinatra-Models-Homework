class PostsController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  # INDEX
  get '/' do

   @title = "Blog posts"

   @posts = Post.all

   erb :'posts/index'

  end

  # NEW
  get '/new' do

    @post = Post.new

    erb :'posts/new'

  end

  # SHOW
  get '/:id' do

    id = params[:id].to_i

    @post = Post.find id

    erb :'posts/show'
  end

  # CREATE
  post '/' do
    post = Post.new

    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect '/'

  end

  # EDIT
  get '/:id/edit' do

    id = params[:id].to_i

    @post = Post.find id

    erb :'posts/edit'

  end

  # UPDATE


  put '/:id' do
    id = params[:id].to_i

    post = Post.find id

    post.title = params[:title]
    post.body = params[:body]

    post.save

    redirect '/'
  end

  # DESTROY
  delete '/:id' do

    id = params[:id].to_i

    Post.destroy id

    redirect '/'

  end

end
