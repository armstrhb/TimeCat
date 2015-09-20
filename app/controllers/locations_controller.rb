class LocationsController < ApplicationController
  def index
    @universe = Universe.find_by(name: params[:name])
    @locations = @universe.locations.where(part_of: nil)
  end

  def show
    @universe = Universe.find_by(name: params[:name])
    @location = Location.find_by(name: params[:location], universe: @universe)
  end

  def search
    @locations = Location.where(Location.arel_table[:name].matches("%#{params[:name]}%"))
  end

  def drill
    @head = Location.find(params[:id])
    @locations = Location.where(part_of: params[:id])
  end

  def climb
    @locations = Location.find(part_of: params[:id])
  end
end
