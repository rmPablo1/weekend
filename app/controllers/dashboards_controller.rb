class DashboardsController < ApplicationController

  def dashboard
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: current_user)


    if params[:friends]
      friends_events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: params[:friends].keys)
      @events = @events.or(friends_events)
    end

    # raise
    @friends = Contact.all.where(sender: current_user)
  end

end
