class LocationsController < ApplicationController
  def index
    @universe = Universe.find_by(name: params[:name])
    @locations = @universe.locations.where(part_of: nil)
    @new_location = Location.new

    @all_locations = Location.where(universe: @universe)
    @all_locations << Location.new(id: -1, name: "None")
    @all_locations = @all_locations.sort { |a,b| a.id <=> b.id }
  end

  def show
    @universe = Universe.find_by(name: params[:name])
    @location = Location.find_by(name: params[:location], universe: @universe)
  end

  def search
    @locations = Location.where(Location.arel_table[:name].matches("%#{params[:criteria]}%")).uniq
  end

  def create
    @location = Location.new(create_params)

    if @location.part_of == nil
      @location.part_of = nil
    end

    @location.save
    redirect_to location_show_path(@location.universe.name, @location.name), notice: "Location successfully created."
  end

  def drill
    @head = Location.find(params[:id])
    @locations = Location.where(part_of: params[:id])
  end

  def climb
    @locations = Location.find(part_of: params[:id])
  end

  def description
    universe = Universe.find_by(name: params[:universe])
    location = Location.find_by(name: params[:location], universe: universe)
    @description = ""

    if ! location.nil?
      @description = location.description
    end
  end

  def update_description
    universe = Universe.find_by(name: params[:universe])

    if ! universe.nil?
      @location = Location.find_by(name: params[:location], universe: universe)
      @location.description = params[:description]

      @location.save
    end
  end

  private
    def create_params
      params.require(:location).permit(:name, :description, :part_of_id, :universe_id)
    end
end
