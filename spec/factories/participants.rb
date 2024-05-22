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
FactoryBot.define do
  factory :participant do
    user
    chatroom
  end
end
