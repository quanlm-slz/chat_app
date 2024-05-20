# frozen_string_literal: true

class User::RegistrationsController < Devise::RegistrationsController
  def create
    super { |user| raise ActiveRecord::RecordInvalid, user unless user.persisted? }
  end

  def respond_with(user, **_opts)
    success_response(user)
  end
end
