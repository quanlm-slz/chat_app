# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chatroom::ParticipantPolicy, type: :policy do
  let(:user_chatroom) { create(:chatroom) }
  let(:other_chatroom) { create(:chatroom) }
  let(:participant) { create(:participant, chatroom: user_chatroom) }
  let(:user) { participant.user }

  permissions :index? do
    it { expect(described_class).not_to permit(user, other_chatroom) }
    it { expect(described_class).to permit(user, user_chatroom) }
  end
end
