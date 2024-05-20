# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User::Sessions' do
  let(:user) { create(:user) }
  let(:password) { 'password' }

  describe 'user sign in' do
    let(:request) { post '/user/sign_in', params: { user: { email: user.email, password: } } }

    context 'with the incorrect password' do
      let(:password) { 'invalid password' }

      before { request }

      it_behaves_like 'error_response', 401, 'Invalid Email or password.'
    end

    context 'with the correct password' do
      before { request }

      let(:json_response) { response.parsed_body }

      it_behaves_like 'success_response'
      it { expect(json_response.dig('data', 'token')).not_to be_blank }
    end
  end

  describe 'user sign out' do
    include_context 'when user signed in'
    let(:request) { delete '/user/sign_out', headers: }

    it 'increase deny list with request' do
      expect { request }.to change(Denylist, :count).by(1)
    end

    context 'when response' do
      before { request }

      it_behaves_like 'success_response'
    end
  end
end
