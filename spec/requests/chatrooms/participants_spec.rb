require 'rails_helper'

RSpec.describe "Chatrooms::Participants", type: :request do
  let(:headers) { {} }
  let(:chatroom) { create(:chatroom) }
  let(:user) { create(:user) }

  describe "GET /index" do
    let(:request) { get "/chatrooms/#{chatroom.id}/participants", headers: }
    before { request }

    context 'when user not signed in' do
      it_behaves_like "error_response", 401
    end

    context 'when external user response' do
      include_context "when user signed in"

      it_behaves_like "error_response", 403
    end
  end
end
