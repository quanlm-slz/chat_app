# frozen_string_literal: true

class Chatroom::ParticipantPolicy < ApplicationPolicy
  def index?
    user.chatroom == record
  end
end
