class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :create_events ]
  skip_before_action :verify_authenticity_token


  def home
    if user_signed_in?
      redirect_to dashboard_path
    end
    @start_link = user_signed_in? ? dashboard_path : new_user_session_path
  end

  def create_events_google
    puts "printing the params!!!!"

    params[:result][:items].each do |event|
      puts "here is the start date"
      puts event[:start]
      puts "----------------------------------------"
      store_event = Event.new(summary: event[:summary], google_event_id: event[:id], start_time: event[:start].values.first, end_time: event[:end].values.first, user: current_user)
      unless Event.where(google_event_id: event[:id]).exists?
        store_event.save!
      else
        puts "The event already exists!"
      end
    end
  end
end
