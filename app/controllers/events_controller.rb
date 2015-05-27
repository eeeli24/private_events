class EventsController < ApplicationController

  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def show
    @event = Event.find(params[:id])
    @creator = @event.creator
    @current_user = current_user
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private

    def event_params
      params.require(:event).permit(:date, :description)
    end
end
