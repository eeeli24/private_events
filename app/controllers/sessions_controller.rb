class SessionsController < ApplicationController

  def new
  end

  def create
    session[:current_user] = User.find(params[:session][:id])
    redirect_to root_url
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_url
  end
end
