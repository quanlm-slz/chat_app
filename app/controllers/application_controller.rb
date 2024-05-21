# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization
  include ErrorHandlers
  include ResponseHandlers
  include ParamsHandlers

  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
