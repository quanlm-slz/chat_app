# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chatrooms::Participants' do
  let(:headers) { {} }
  let(:chatroom) { create(:chatroom) }
  let(:participant) { create(:participant, chatroom:) }
  let(:user) { participant.user }

  describe 'GET /index' do
    let(:request) { get "/chatrooms/#{chatroom.id}/participants", headers: }

    before { request }

    context 'when user not signed in response' do
      it_behaves_like 'error_response', 401
    end

    context 'when external user response' do
      let(:user) { create(:user) }

      include_context 'when user signed in'

      it_behaves_like 'error_response', 403, 'User is not authorized.'
    end

    context 'when participant response' do
      include_context 'when user signed in'

      it_behaves_like 'paginated_response'
    end
  end

  describe 'POST /create' do
    let(:body) { {} }
    let(:header) { {} }
    let(:request) { post "/chatrooms/#{chatroom.id}/participants", params: body, headers: }

    context 'when user not signed in response' do
      before { request }

      it_behaves_like 'error_response', 401
    end

    context 'when invite code is missing response' do
      before { request }

      include_context 'when user signed in'

      it_behaves_like 'error_response', 400
    end

    context 'when invite code is invalid response' do
      let(:body) { { invite_code: 'wrong invite code' } }

      before { request }

      include_context 'when user signed in'

      it_behaves_like 'error_response', 404
    end

    context 'when current participant response' do
      let(:body) { { invite_code: chatroom.invite_code } }

      before { request }

      include_context 'when user signed in'

      it_behaves_like 'error_response', 422
    end

    context 'when request with invite code' do
      let(:user) { create(:user) }
      let(:body) { { invite_code: chatroom.invite_code } }

      include_context 'when user signed in'

      it { expect { request }.to change(chatroom, :participants_count).by(1) }
    end
  end

  describe 'DELETE /destroy' do
    let(:request) { delete "/chatrooms/#{chatroom.id}/participants/#{participant.id}", headers: }

    context 'when user not sign in' do
      before { request }

      it_behaves_like 'error_response', 401
    end

    context 'when current participant request' do
      include_context 'when user signed in'

      before { participant }

      it { expect { request }.to change(Participant, :count).by(-1) }
    end

    context 'when current participant response' do
      include_context 'when user signed in'

      before { request }

      it_behaves_like 'success_response'
    end

    context 'when other user response' do
      let(:user) { create(:user) }
      let(:other_participant) { create(:participant, user_id: user.id, chatroom_id: chatroom.id) }

      include_context 'when user signed in'

      before { 
        other_participant
        request
      }

      it_behaves_like 'error_response', 403
    end
  end
end
