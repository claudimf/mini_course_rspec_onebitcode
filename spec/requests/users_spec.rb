require "rails_helper"

RSpec.describe 'Users', type: :request do
  describe 'Get /users' do
    it ' works! (now writ some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it ' returns success status' do
      get users_path
      expect(response).to have_http_status(200)
    end
    it ' the user´s title is present' do
      users = create_list(:user, 3)
      get users_path
      users.each do |user|
        expect(response.body).to include(user.title)
      end
    end
  end

  describe 'Post /users' do
    context ' when it has valid parameters' do
      it ' creates the user with correct attributes' do
        user_attributes = FactoryBot.attributes_for(:user)
        post users_path, params: { user: user_attributes }
        expect(User.last).to have_attributes(user_attributes)
        expect(User.all.count).to eq(1)
      end
    end
    context ' when it has no valid parameters' do
      it ' does not create user' do
        user_attributes = {kind: '', name: '', level: ''}
        expect{ post users_path, params: { user: user_attributes } }.to_not change(User, :count)
      end
    end
  end
end
