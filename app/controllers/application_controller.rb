require './config/environment'

class ApplicationController < Sinatra::Base
enable :sessions

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  get '/tweets' do
    @tweets= Tweet.all
    @user = current_user
    erb :'/tweets/tweets'
  end
  #create
  get '/tweets/new' do
    erb :'create_tweet'
  end
binding.pry
  post '/tweets' do
    @tweet= Tweet.create(content: params["content"])
    @tweet.save
    redirect("/tweets/#{@tweet.id}")
  end



  #show
  get 'tweets/:id' do

  end

  #edit
  get 'tweets/:id/edit' do

  end

  post 'tweets/:id' do

  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if user.username.empty? || user.password.nil?
      redirect "/failure"
    else
      user.save
      redirect "/login"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end #will return True or False

    def current_user
      logged_in? ? User.find(session[:user_id]) : nil
    end
  end

end
