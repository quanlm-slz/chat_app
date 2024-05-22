# frozen_string_literal: true

class AddUniqueIndexForUserIdAndChatroomIdToParticipant < ActiveRecord::Migration[7.1]
  def change
    add_index :participants, %i[user_id chatroom_id], unique: true
  end
end
