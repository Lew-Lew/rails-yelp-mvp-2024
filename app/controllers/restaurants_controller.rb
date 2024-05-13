class RestaurantsController < ApplicationController
  def index
    # afficher tous les restaurants
    @restaurants = Restaurant.all
  end

  def show
    # trouver le restaurant avec l'id correspondant à celui dans l'URL
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # créer un restaurant vide pour le form
    @restaurant = Restaurant.new
  end

  def create
    # créer un restaurant avec les params du form
    @restaurant = Restaurant.new(restaurant_params)
    # si le restaurant est bien sauvegardé, rediriger vers la page du restaurant
    # sinon, re-render le form
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def restaurant_params
    # autoriser les paramètres name, address, category pour le form
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
