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

        event = Event.new(set_params)
        event.user = User.find(user_id)
        event.save
      end

      redirect_to controller: "dashboards", action: "dashboard", start_date: params[:event][:start_time].to_datetime
        else
      render "new", status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to dashboard_path
  end

  private

  def set_params
    params.require(:event).permit(:start_time, :end_time, :summary)
  end
end
