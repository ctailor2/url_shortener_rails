class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email].downcase)
    if @user
      if @user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to ###
      else
        @user.errors.add(:password, 'incorrect')
        render :new
      end
    else
      @user.errors.add(:email, 'not found')
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to urls_path
  end
end
