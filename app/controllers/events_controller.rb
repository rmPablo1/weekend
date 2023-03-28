class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(set_params)
    event.user = current_user
    if event.save!
      params[:event][:user_id].each do |user_id|
        next if user_id == ""

        invitation = Invitation.new
        invitation.event = event
        invitation.user = User.find(user_id)
        invitation.save!
      end
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
