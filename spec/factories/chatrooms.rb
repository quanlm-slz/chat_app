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
#  index_chatrooms_on_invite_code  (invite_code)
#  index_chatrooms_on_owner_id     (owner_id)
#
FactoryBot.define do
  factory :chatroom do
    name { Faker::Name.name }
    owner factory: :user
  end
end
