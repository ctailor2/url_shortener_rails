class UrlsController < ApplicationController
  def index
    @urls = Url.where(user_id: nil)
    @url = Url.new()
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      # redirect to root if not signed in
      # else redirect to users profile page
      redirect_to urls_path
    else
      @urls = Url.where(user_id: nil)
      render :index
      # redirect_to urls_path
    end
  end

  def update
    url = Url.find(params[:id])
    Url.increment_counter(:click_count, url.id)
    redirect_to url.long_url
  end
end
