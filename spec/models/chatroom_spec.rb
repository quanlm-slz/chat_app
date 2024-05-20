# frozen_string_literal: true

# == Schema Information
#
# Table name: chatrooms
#
#  id          :uuid             not null, primary key
#  invite_code :string(50)       not null
#  name        :string(50)       not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :uuid             not null
#
# Indexes
#
#  index_chatrooms_on_owner_id  (owner_id)
#
require 'rails_helper'

RSpec.describe Chatroom do
  let(:chatroom) { build(:chatroom) }

  describe 'association' do
    it { expect(chatroom).to belong_to(:owner).class_name(User.name) }
  end
end
