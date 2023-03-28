class DashboardsController < ApplicationController

  def dashboard
    p params
    @event = Event.new
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: current_user)
    if params[:friends]
      friends_events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: params[:friends].keys)
      @events = @events.or(friends_events)
    end
    # raise
    @friends = current_user.following
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(set_params)
    @event.user = current_user
    if @event.save!
      redirect_to dashboard_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def set_params
    params.require(:event).permit(:start_time, :end_time, :summary)
  end



end
