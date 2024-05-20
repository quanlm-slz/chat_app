# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User::Registrations' do
  let(:user) { attributes_for(:user) }
  let(:request) { post '/user/sign_up', params: { user: } }

  describe 'user sign up' do
    context 'when given insufficient data' do
      before { request }

      let(:user) { {} }

      it_behaves_like 'error_response', 422
    end

    it 'increase user with valid request' do
      expect { request }.to change(User, :count).by(1)
    end

    context 'when respond after given sufficient data' do
      before { request }

      let(:json_response) { response.parsed_body }

      it_behaves_like 'success_response'
      it { expect(json_response.dig('data', 'token')).not_to be_blank }
    end
  end
end
