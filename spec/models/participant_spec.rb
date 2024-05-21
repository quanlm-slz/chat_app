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
#  index_participants_on_chatroom_id  (chatroom_id)
#  index_participants_on_user_id      (user_id)
#
require 'rails_helper'

RSpec.describe Participant, type: :model do
  let(:participant) { build(:participant) }

  describe 'association' do
    it { expect(participant).to belong_to(:user) }
    it { expect(participant).to belong_to(:chatroom) }
  end
end
