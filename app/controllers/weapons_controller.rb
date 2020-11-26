class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :edit, :destroy]
  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to users_path
  end

  def destroy
    @weapon.destroy
    redirect_to weapons_url, notice: 'Weapon was deleted'
  end

  def show
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :description)
  end

  def set_weapon
    @weapon = Weapon.find(params[:id])
  end
end
