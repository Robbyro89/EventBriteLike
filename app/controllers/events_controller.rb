class EventsController < ApplicationController

  before_action :set_event, only: [:show, :destroy, :subscribe]
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    @event.creator = current_user
    if @event.save
      flash.now[:success] = "Success"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def show
  end

  def subscribe
    @event.attendees << current_user
    flash.now[:success] = "Participation with success"
    redirect_to root_path
  end

  def invite
    @event = Event.find(params[:event_id])
    @user = User.find(params[:id])
    puts @event.inspect
    @event.attendees << @user
    flash.now[:success] = "Participation with success"
    redirect_to @event
  end

  def destroy
    @event.destroy
    flash.now[:success] = "Delete with success !"
    redirect_to current_user
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :place, :creator_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
