class TweetsController < ApplicationController
  
  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
  
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def new
  end
  
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
        if @tweet.update(tweet_params)
          format.html { redirect_to @tweet, notice: 'Post was successfully updated.' }
        else
        format.html { render :edit }

        end
    end
  end

  def destroy
  end
  
  def index
    @tweets = Tweets.all
  end  
 private
 
 def set_tweet
    @tweet = Tweet.find(params[:id])
 end

 def tweet_params
    params.require(:tweet).permit(:message, :user_id)
 end
end
