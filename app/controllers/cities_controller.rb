class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @cities = City.find(params[:id])
  end

  def edit
    @cities = City.find(params[:id])
  end

  def update
    @cities = City.find(params[:id])
    @cities.update(cities_params)
    redirect_to cities_path
  end

  def new
    @cities = City.new
  end

  def create
    city = City.create(cities_params)
    redirect_to cities_path
  end

  def destroy
    @cities = City.find(params[:id])
    @cities.destroy
    redirect_to cities_path
  end

  private

  def cities_params
    params.require(:city).permit(:nom_ville)

  end
end
