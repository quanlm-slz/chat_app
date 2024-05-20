class FailureApp < Devise::FailureApp
  def respond
    self.status = 401
    self.response_body = {
      status: 401,
      message: 'error',
      errors: [i18n_message]
    }.to_json
  end
end
