# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id          :uuid             not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chatroom_id :uuid             not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_participants_on_chatroom_id              (chatroom_id)
#  index_participants_on_user_id                  (user_id)
#  index_participants_on_user_id_and_chatroom_id  (user_id,chatroom_id) UNIQUE
#
require 'rails_helper'

RSpec.describe Participant do
  let(:participant) { build(:participant) }

  describe 'association' do
    it { expect(participant).to belong_to(:user) }
    it { expect(participant).to belong_to(:chatroom) }
    it { expect(participant).to delegate_method(:username).to(:user).allow_nil }
    it { expect(participant).to delegate_method(:email).to(:user).allow_nil }
  end

  describe 'validation' do
    it { expect(participant).to validate_uniqueness_of(:user_id).scoped_to(:chatroom_id).case_insensitive }
  end
end
