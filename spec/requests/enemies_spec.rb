require 'rails_helper'

RSpec.describe 'Enemies', type: :request do
  describe 'PUT /enemies' do
    context ' when the enemy exists' do
      it ' return status code 200' do
        enemy = create(:enemy)
        enemy_attributes = attributes_for(:enemy)
        put "/enemies/#{enemy.id}", params: {enemy: enemy_attributes}
        expect(response).to have_http_status(200)
      end

      it ' updates the enemy' do
        enemy = create(:enemy)
        enemy_attributes = attributes_for(:enemy)
        put "/enemies/#{enemy.id}", params: {enemy: enemy_attributes}
        expect(enemy.reload).to have_attributes(enemy_attributes)
      end


      it ' return the enemy updated' do
        enemy = create(:enemy)
        enemy_attributes = attributes_for(:enemy)
        put "/enemies/#{enemy.id}", params: {enemy: enemy_attributes}

        json_response = JSON.parse(response.body)
        expect(enemy.reload).to have_attributes(json_response.except('created_at', 'updated_at'))
      end
    end

    context ' when the enemy does not exists' do
      it ' return status code 404'
      it ' returns a not found message'
    end
  end
end
