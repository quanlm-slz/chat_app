# frozen_string_literal: true

class ChatroomPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      @scope.where(owner_id: user.id)
    end
  end
end
