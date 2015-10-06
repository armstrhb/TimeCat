class EventsController < ApplicationController
  def index
    @universe = Universe.find_by(name: params[:universe])

    if not @universe.nil?
      @events = @universe.events
    end
  end

  def show
    @universe = Universe.find_by(name: params[:universe])

    if not @universe.nil?
      @event = Event.find_by(name: params[:name], universe: @universe)
    end
  end

  def create
    @event = Event.new(create_params)

    @event.save
    redirect_to event_show_path(@event.universe.name, @event.name), notice: "Event created"
  end

  def description
    universe = Universe.find_by(name: params[:universe])
    event = Event.find_by(name: params[:event], universe: universe)
    @description = ""

    if ! event.nil?
      @description = event.description
    end
  end

  def update_description
    universe = Universe.find_by(name: params[:universe])

    if ! universe.nil?
      @event = Event.find_by(name: params[:event], universe: universe)
      @event.description = params[:description]

      @event.save
    end
  end

  private
    def create_params
      params.require(:event).permit(:name, :description, :part_of_id, :universe_id)
    end
end
