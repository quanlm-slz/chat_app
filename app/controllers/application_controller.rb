# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ErrorHandlers
  include ResponseHandlers

  before_action :configure_permitted_params, if: :devise_controller?

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
