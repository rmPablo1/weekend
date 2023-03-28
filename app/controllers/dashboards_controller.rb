class DashboardsController < ApplicationController

  def dashboard
    p params
    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: current_user)
    @user_color = "#b8ffb2"
    if params[:friends]
      friends_events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: params[:friends].keys)
      @events = @events.or(friends_events)
      @friends_colors = ["#70D3D8", "#E0C9F0", "#FFDC89", "#8AB7FF", '#FFABAB'].sample(params[:friends].keys.size)

    end
    # raise
    @friends = current_user.following
    @eventarray = @events.map { |event| event.id }
  end
end
