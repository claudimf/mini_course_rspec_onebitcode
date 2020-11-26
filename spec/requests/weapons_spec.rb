require "rails_helper"

RSpec.describe 'Weapons', type: :request do
  describe 'GET /weapons' do
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

  describe 'POST /weapons' do
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

  describe 'DELETE /weapons' do
    it 'destroys the requested weapon' do
      weapon = create(:weapon)
      expect {
        delete "/weapons/#{weapon.id}"
      }.to change(Weapon, :count).by(-1)
    end
  end

  describe 'GET #shows' do
    let!(:weapon) { create(:weapon) }

    before(:each) do
      get "/weapons/#{weapon.id}"
    end

    it ' the weapon´s name is present' do
      expect(response.body).to include(weapon.name)
    end

    it ' the weapon´s description is present' do
      expect(response.body).to include(weapon.description)
    end

    it ' the weapon´s level is present' do
      expect(response.body).to include(weapon.level.to_s)
    end

    it ' the weapon´s power_base is present' do
      expect(response.body).to include(weapon.power_base.to_s)
    end

    it ' the weapon´s power_step is present' do
      expect(response.body).to include(weapon.power_step.to_s)
    end

    it ' the weapon´s current_power is present' do
      expect(response.body).to include(weapon.current_power.to_s)
    end

    it ' the weapon´s title is present' do
      expect(response.body).to include(weapon.title)
    end

  end

end
