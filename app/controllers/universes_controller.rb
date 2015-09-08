class UniversesController < ApplicationController
  def index
    @universes = Universe.all
  end

  def show
    @universe = Universe.find_by(name: params[:name])
    @events = @universe.events
  end
end
