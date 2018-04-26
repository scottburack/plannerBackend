class Api::V1::EventsController < ApplicationController

  skip_before_action :authorized

  def index
    @events = Event.all
    render json: @events
  end

  def create
    @event = Event.create(event_params)
  end

  def show
    @event = Event.find(params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:group_id, :name, :date_start, :date_end, :time_start, :time_end, :votes, :img_url, :event_url)
  end

end
