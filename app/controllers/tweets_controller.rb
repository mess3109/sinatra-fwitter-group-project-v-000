class TweetsController<ApplicationController

  get '/tweets' do
    if logged_in?
    @tweets= Tweet.all
    erb :'/tweets/tweets'
    else
      redirect to "/login"
    end
  end
  
  #create
  get '/tweets/new' do
    erb :'create_tweet'
  end

  post '/tweets' do
    @tweet= Tweet.create(content: params[:content], user_id: session[:user_id])
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
end
