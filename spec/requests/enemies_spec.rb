require 'rails_helper'

RSpec.describe 'Enemies', type: :request do
  describe 'PUT /enemies' do
    context ' when the enemy exists' do
      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { attributes_for(:enemy) }
      before(:each) { put "/enemies/#{enemy.id}", params: {enemy: enemy_attributes} }

      it ' return status code 200' do
        expect(response).to have_http_status(200)
      end

      it ' updates the enemy' do
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end

      it ' return the enemy updated' do
        expect(enemy.reload).to have_attributes(json.except('created_at', 'updated_at'))
      end
    end

    context ' when the enemy exists and params is invalid' do
      let(:enemy) { create(:enemy) }
      let(:enemy_attributes) { {name: nil, kind: nil, level: nil} }
      before(:each) { put "/enemies/#{enemy.id}", params: {enemy: enemy_attributes} }

      it ' return status code 422 (Unprocessable Entity)' do
        expect(response).to have_http_status(422)
      end

      it ' return erros messages for attributes' do
        expect(json).to eq({"message"=>{"level"=>["is not a number", "can't be blank"], "name"=>["can't be blank"], "kind"=>["can't be blank"]}})
      end
    end

    context ' when the enemy does not exists' do
      before(:each) { put '/enemies/0', params: attributes_for(:enemy) }
      it ' return status code 404' do
        expect(response).to have_http_status(404)
      end

      it ' returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'DELETE /enemies' do
    context ' when the enemy exists' do
      let(:enemy) { create(:enemy) }
      before(:each) { delete "/enemies/#{enemy.id}" }
      it ' return status code 204' do
        expect(response).to have_http_status(204)
      end

      it ' destroy the record' do
        expect {enemy.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end

    context ' when the enemy does not exists' do
      before(:each) { delete '/enemies/0' }
      it ' return status code 404' do
        expect(response).to have_http_status(404)
      end

      it ' returns a not found message' do
        expect(response.body).to match(/Couldn't find Enemy/)
      end
    end
  end

  describe 'Get /enemies' do
    it ' returns success status' do
      get enemies_path
      expect(response).to have_http_status(200)
    end

    it ' the user´s title is present' do
      enemies = create_list(:enemy, 3)
      get enemies_path
      enemies.each do |enemy|
        expect(json).to include(JSON.parse(enemy.to_json))
      end
    end
  end

  describe 'POST /users' do
    context ' when it has valid parameters' do
      it ' creates the user with correct attributes' do
        enemy_attributes = FactoryBot.attributes_for(:enemy)
        post enemies_path, params: { enemy: enemy_attributes }
        expect(Enemy.last).to have_attributes(enemy_attributes)
        expect(Enemy.all.count).to eq(1)
      end
    end
    context ' when it has no valid parameters' do
      it ' does not create user' do
        enemy_attributes = Enemy.new.attributes
        expect{ post enemies_path, params: { enemy: enemy_attributes } }.to_not change(Enemy, :count)
      end
    end
  end
end
