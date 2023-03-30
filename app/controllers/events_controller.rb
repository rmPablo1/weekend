class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    if add_event_current_user(set_params).save!
      params[:event][:user_id].each do |user_id|
        next if user_id == ""

        add_event_different_user(set_params, user_id)
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

  def add_event_different_user(set_params, user_id)
    event = Event.new(set_params)
    event.user = User.find(user_id)
    event.google_event_id = rand
    event.save!
  end

  def add_event_current_user(set_params)
    event = Event.new(set_params)
    event.user = current_user
    event.google_event_id = rand
    return event
  end

  def set_params
    params.require(:event).permit(:start_time, :end_time, :summary, :google_event_id)
  end
end
