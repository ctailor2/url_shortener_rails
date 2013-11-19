class UrlsController < ApplicationController
  include SessionsHelper

  def index
    if signed_in?
      @urls = Url.where(user_id: current_user)
    else
      @urls = Url.where(user_id: nil)
    end
    @url = Url.new()
  end

  def create
    @url = Url.new(params[:url])
    if signed_in?
      @url.user_id = current_user.id
      if @url.save
        redirect_to urls_path
      else
        @urls = Url.where(user_id: current_user)
        render :index
      end
    else
      if @url.save
        redirect_to urls_path
      else
        @urls = Url.where(user_id: nil)
        render :index
      end
    end
  end

  def update
    url = Url.find(params[:id])
    Url.increment_counter(:click_count, url.id)
    redirect_to url.long_url
  end
end
