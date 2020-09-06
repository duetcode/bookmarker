# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'api/v1' do
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
    end
  end

  resources :apidocs, only: [:index]
  resources :swagger, only: [:index]
end
