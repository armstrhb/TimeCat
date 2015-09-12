class UniversesController < ApplicationController
  def index
    @universes = Universe.all
  end

  def show
    @universe = Universe.find_by(name: params[:name])
    @events = @universe.events
  end

  def description
    universe = Universe.find_by(name: params[:name])
    @description = ""

    if ! universe.nil?
      @description = universe.description
    end
  end

  def update_description
    @universe = Universe.find_by(name: params[:name])
    if ! @universe.nil?
      @universe.description = params[:description]
      @universe.save
    end
  end
end
