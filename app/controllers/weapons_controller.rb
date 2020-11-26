class WeaponsController < ApplicationController
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to users_path
  end

  def destroy
  end

  def show
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :description)
  end
end
