# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :all

  as :user do
    namespace :user do
      post 'sign_up', to: 'registrations#create'
      post 'sign_in', to: 'sessions#create'
      delete 'sign_out', to: 'sessions#destroy'
    end
  end
  get 'up' => 'rails/health#show', as: :rails_health_check
end
