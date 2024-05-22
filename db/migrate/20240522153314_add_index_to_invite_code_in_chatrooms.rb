# frozen_string_literal: true

class AddIndexToInviteCodeInChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_index :chatrooms, :invite_code
  end
end
