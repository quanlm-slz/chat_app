# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatroomPolicy, type: :policy do
  let!(:user) { create(:user) }
  let!(:owned_chatroom) { create(:chatroom, owner: user) }
  let!(:unowned_chatroom) { create(:chatroom) }
  let(:scope) { Pundit.policy_scope!(user, Chatroom) }

  permissions '.scope' do
    it { expect(scope.to_a).to include(owned_chatroom) }
    it { expect(scope.to_a).not_to include(unowned_chatroom) }
  end
end
