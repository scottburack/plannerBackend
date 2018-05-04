

class Api::V1::EventsController < ApplicationController

  skip_before_action :authorized

  KEY = 'S8po5Zyz7yMcXQkwjJHqwpMLHUAEbgiI7DjF2Bisr_lCA8OqlGq4woS7FR7uI8gIVXPDpe1GUKKBvfxWqWrEK9TI8Nm177R0VW4sKASu668bUfMEz677uEch4CS5WnYx'
  BASE_URL = "https://api.yelp.com/v3/businesses/search?"


  def index
    @events = Event.all
    render json: @events
  end

  def create
    @event = Event.create(event_params)
    @group = Group.find(params[:event][:group_id])
    render json: @group.events
  end

  def show
    byebug
    @event = Event.find(params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def update
    # byebug
    @event = Event.find(params[:id])
    @event.votes = params[:event][:votes]
    @event.save
    # byebug
    render json: @event
  end

  def fetch_from_yelp
    params[:state] == "" ? yelp_url = "location=#{params[:city]}?#{params[:country]}&" : yelp_url = "location=#{params[:city]}?#{params[:state]}?#{params[:country]}&"
    params[:location_name] == "" ? term = "term=#{params[:radio_value]}" : term = "term=#{params[:location_name]}&#{params[:radio_value]}"

    # page = RestClient::Request.execute method: :get, url: BASE_URL + yelp_url + term, Authorization: "Bearer #{KEY}"
    page = RestClient.get(BASE_URL + yelp_url + term, {Authorization: "Bearer " + KEY})
    event_hash = JSON.parse(page)
    puts event_hash
    render json: event_hash
  end

  #(name === "") ? term = `term=${category}` : term = `term=${name}&${category}`
#let yelpURL;
#(json.state === "") ?  yelpURL = `location=${json.city}?${json.country}&` : yelpURL = `location=${json.city}?${json.state}?${json.country}&`

  private

  def event_params
    params.require(:event).permit(:group_id, :name, :date_start, :date_end, :time_start, :time_end, :votes, :img_url, :event_url,
      :city, :state, :country, :radio_value, :location_name)
  end

end
