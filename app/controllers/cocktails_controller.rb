class CocktailsController < ApplicationController

before_action :set_cocktail, except: [:index, :new, :create]

  def create
     @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
          redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

private

  def cocktail_params
    params.require(:cocktail).permit(:name, :address, :phone_number, :category)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id].to_i)
  end

end
