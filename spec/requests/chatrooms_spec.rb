# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chatrooms' do
  let(:headers) { {} }
  let(:user) { create(:user) }

  describe 'GET /index' do
    let(:request) { get '/chatrooms', headers: }

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
    let(:chatroom) { { name: 'chatroom' } }
    let(:request) { post '/chatrooms', headers:, params: { chatroom: } }

    context 'when user not signed in' do
      before { request }

      it_behaves_like 'error_response', 401
    end

    context 'when request with missing params' do
      include_context 'when user signed in'

      let(:chatroom) { {} }

      it { expect { request }.not_to change(Chatroom, :count) }
    end

    context 'when response with missing params' do
      include_context 'when user signed in'

      let(:chatroom) { {} }

      before { request }

      it_behaves_like 'error_response', 400
    end

    context 'when request with valid params' do
      include_context 'when user signed in'
      it { expect { request }.to change(Chatroom, :count).by(1) }
    end

    context 'when response with valid params' do
      include_context 'when user signed in'
      before { request }

      it_behaves_like 'success_response'
    end
  end

  describe 'DELETE /chatrooms/:id' do
    let!(:chatroom) { create(:chatroom) }
    let(:request) { delete "/chatrooms/#{chatroom.id}", headers: }

    context 'when user not signed in' do
      before { request }

      it_behaves_like 'error_response', 401
    end

    context 'when user not own the chatroom' do
      include_context 'when user signed in'
      before { request }

      it_behaves_like 'error_response', 404, 'Record not found'
    end
  end
end
