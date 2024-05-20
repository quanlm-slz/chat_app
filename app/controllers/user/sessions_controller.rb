# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  def respond_with(user, **_opts)
    success_response(user)
  end

  def respond_to_on_destroy
    no_content_response
  end
end
