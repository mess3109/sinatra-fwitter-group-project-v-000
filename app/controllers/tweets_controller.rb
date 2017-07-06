class TweetsController < ApplicationController
enable :sessions

  get 'tweets/new' do
    @tweets= Tweet.all
    @user = current_user
    erb :'/tweets/tweets'
    end
  end

  #show
  get 'tweets/:id' do

  end

  #edit
  get 'tweets/:id/edit' do

  end

  post 'tweets/:id' do

  end

  post '/tweets' do
    @tweet= Tweet.create(content: params["content"])
    @tweet.save
    redirect("/tweets/#{@tweet.id}")
  end

end
