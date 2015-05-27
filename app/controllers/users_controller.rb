class UsersController < ApplicationController

  def new
    @user = User.new
    @current_user = current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = upcoming_events(params[:id])
    @previous_events = previous_events(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

    def upcoming_events(user_id)
      upcoming = []
      User.find(user_id).attended_events.each do |event|
        upcoming << event if event.date > Time.now
      end
      upcoming
    end

    def previous_events(user_id)
      previous = []
      User.find(user_id).attended_events.each do |event|
        previous << event if event.date < Time.now
      end
      previous
    end
end
