class LocationsController < ApplicationController
  def index
    @universe = Universe.find_by(name: params[:name])
    @locations = @universe.locations.where(part_of: nil)
  end

  def show
    @location = Location.find(params[:id])
  end

  def search
    @locations = Location.where(Location.arel_table[:name].matches("%#{params[:name]}%"))
  end
end
