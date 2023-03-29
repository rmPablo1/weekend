class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = Event.new(set_params)
    event.user = current_user
    if event.save!
      redirect_to dashboard_path
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
