class EventsController < ApplicationController

  before_filter :get_event, :only => [:show, :edit, :update, :destroy]

  layout "admin", :except => [:index]

  def index
    @events = Event.where("start_date > ?", Time.now).order("start_date asc")
    @grouped_events = @events.group_by{|x| x.start_date.strftime("%Y-%m-%d")}
  end

  def list
    @events = Event.all
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    params.permit!

    @event = Event.new(params[:event])
    if @event.save
      redirect_to events_path
    else
      render :action => :new
    end
  end

  def edit

  end

  def update
    params.permit!
    if @event.update_attributes(params[:event])
      redirect_to events_path
    else
      rediect_to events_path
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    end
  end

  private

  def get_event
    @event = Event.find(params[:id])
  end
end
