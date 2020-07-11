# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'POST /api/v1/users' do
    let(:user_params) do
      { email: 'user@duetcode.io', password: 'samplepassword' }
    end

    it 'creates a new user' do
      post api_v1_users_path, params: { user: user_params }
      expected_body = { 'email' => 'user@duetcode.io' }

      expect(response).to have_http_status(:created)
      expect(load_body(response)['user']).to include(expected_body)
    end

    it 'returns unprocessable entity with errors' do
      user_params[:password] = nil
      post api_v1_users_path, params: { user: user_params }

      expected_error = { 'password' => ['can\'t be blank'] }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(load_body(response)).to eq(expected_error)
    end
  end
end
