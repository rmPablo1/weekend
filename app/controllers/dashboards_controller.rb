class DashboardsController < ApplicationController
  def dashboard
    @groups = Group.where(user: current_user)

    start_date = params.fetch(:start_date, Date.today).to_date
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: current_user)
    @user_color = "#b8ffb2"

    # @invitation_events = Event.joins(:invitations).where("invitations.user_id" == current_user.id ).where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    if params[:friends]
      friends_events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).where(user_id: params[:friends].keys)
      @events = @events.or(friends_events)
    elsif params[:groups]
      @selected_groups = Group.where(id: params[:groups].keys)
      groups_events = []
      @selected_groups.each do |group|
        group.users.each do |user|
          user.events.each do |event|
            if event.start_time.between?(start_date.beginning_of_month.beginning_of_week, start_date.end_of_month.end_of_week)
              groups_events << event
            end
          end
        end
      end
      unless groups_events.nil?
        @events = @events + groups_events
      end
    end
    # raise
    @friends = current_user.following
    @friend_requests_counter = current_user.follow_requests.count if current_user.follow_requests.count.positive?

      @friends_colors = ["#70D3D8", "#E0C9F0", "#FFDC89", "#8AB7FF", '#FFABAB'].sample(params[:friends].keys.size)

    end
    # raise
    @friends = current_user.following
    @eventarray = @events.map { |event| event.id }
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
