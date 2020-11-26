require "rails_helper"

RSpec.describe 'Weapons', type: :request do
  describe 'Get /weapons' do
    it ' returns success status' do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    context ' validate params' do
      let!(:weapons) { create_list(:weapon, 3) }

      it ' the weapon´s name is present' do
        weapons = create_list(:weapon, 3)
        get weapons_path
        weapons.each do |weapon|
          expect(response.body).to include(weapon.name)
        end
      end

      it ' the weapon´s title is present' do
        weapons = create_list(:weapon, 3)
        get weapons_path
        weapons.each do |weapon|
          expect(response.body).to include(weapon.title)
        end
      end

      it ' the weapon´s current_power is present' do
        weapons = create_list(:weapon, 3)
        get weapons_path
        weapons.each do |weapon|
          expect(response.body).to include(weapon.current_power.to_s)
        end
      end
    end
  end

  describe 'Post /weapons' do
    context ' when it has valid parameters' do
      it ' creates the weapon with correct attributes' do
        weapon_attributes = FactoryBot.attributes_for(:weapon)
        post weapons_path, params: { weapon: weapon_attributes }
        expect(Weapon.last).to have_attributes(weapon_attributes)
        expect(Weapon.all.count).to eq(1)
      end
    end
    context ' when it has no valid parameters' do
      it ' does not create weapon' do
        weapon_attributes = Weapon.new.attributes
        expect{ post weapons_path, params: { weapon: weapon_attributes } }.to_not change(Weapon, :count)
      end
    end
  end
end
