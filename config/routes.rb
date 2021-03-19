# frozen_string_literal: true

Rails.application.routes.draw do
  resources :movies, only: [:index]
  resources :seasons, only: [:index]
  resources :contents, only: [:index] do
    resources :purchase_options, only: [:index] do
      resources :purchases, only: [:create]
    end
  end
  resources :users, only: [:library] do
    get 'library', on: :member
  end
end
