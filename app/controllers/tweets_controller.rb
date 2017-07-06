class TweetsController < ApplicationController

  get 'tweets/new' do
    erb :'/tweets/new'
  end

  post 'tweets' do
      @tweet= Tweet.create(content: params["content"])
      @tweet.save
      redirect("/tweets/#{@tweet.id}")
  end

end
