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
class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :user_id, uniqueness: { scope: :chatroom_id }

  delegate :username, to: :user, allow_nil: true
  delegate :email, to: :user, allow_nil: true
end
