class TimelinesController < ApplicationController
  include TimelinesHelper

  def index
    @universes = Universe.all
  end

  def show
    @universe = Universe.find_by(name: params[:name])
    @events = sort_events(@universe.events)
  end
end
