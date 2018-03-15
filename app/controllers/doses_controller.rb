class DosesController < ApplicationController
before_action :set_dose, except: [:new, :create]
before_action :set_cocktail, except: [:destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
          redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktails_path
  end

private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_dose
    @dose = Dose.find(params[:id].to_i)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id].to_i)
  end
end
