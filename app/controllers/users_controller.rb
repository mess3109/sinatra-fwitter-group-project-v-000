class UsersController < ApplicationController
enable :sessions

  get 'signup' do
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
end



helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end
