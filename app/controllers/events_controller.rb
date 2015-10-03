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
end
