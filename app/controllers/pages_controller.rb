class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home create_events]
  skip_before_action :verify_authenticity_token

  def home
    redirect_to dashboard_path if user_signed_in?
    @start_link = user_signed_in? ? dashboard_path : new_user_session_path
  end

  def create_events_google
    params[:result][:items].each do |event|
      new_event(event).save unless Event.where(google_event_id: event[:id]).exists?
    end
    render json: { status: "ok" }
  end

  def new_event(event)
    store_event = Event.new
    store_event.summary = event[:summary]
    store_event.google_event_id = event[:id]
    store_event.start_time = event[:start].values.first
    store_event.end_time = event[:end].values.first
    store_event.user = current_user
    store_event
  end
end
