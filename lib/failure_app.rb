# frozen_string_literal: true

class FailureApp < Devise::FailureApp
  def respond
    self.status = 401
    self.content_type = 'appliction/json'
    self.response_body = {
      status: 401,
      message: 'error',
      errors: [i18n_message]
    }.to_json
  end
end
