class TimelinesController < ApplicationController
  def index
    @universes = Universe.all
  end

  def show
    @universe = Universe.find_by(name: params[:name])
  end
end
