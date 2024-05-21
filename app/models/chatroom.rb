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
class Chatroom < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  attribute :invite_code, default: -> { SecureRandom.hex(10) }

  private

  attr_accessor :invite_code
end
