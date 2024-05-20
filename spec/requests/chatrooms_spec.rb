# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chatrooms' do
  let(:headers) { {} }
  let(:user) { create(:user) }
  let(:request) { get '/chatrooms', headers: }

  describe 'GET /index' do
    before { request }

    context 'when user not signed in' do
      it_behaves_like 'error_response', 401
    end

    context 'when user signed in' do
      include_context 'when user signed in'
      it_behaves_like 'paginated_response'
    end
  end

  describe 'POST /create' do
    let(:chatroom) { attributes_for(:chatroom) }
    let(:request) { post '/chatrooms', headers:, params: { chatroom: } }

    context 'when user not signed in' do
      before { request }
      it_behaves_like 'error_response', 401
    end

    context 'when request with missing params' do
      include_context 'when user signed in'

      let(:chatroom) { { chatroom: { not_required_field: 'data' } } } 

      before { request  }

      it_behaves_like 'error_response', 422
    end
  end
end
