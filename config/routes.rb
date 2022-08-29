# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api', defaults: { format: :json } do
    post 'register_with_email', to: 'sessions#register_with_email'
    post 'login', to: 'sessions#create'

    resources :article_categories, only: %i[index show] do
      post :join
    end

    resources :articles, only: %i[index create show update] do
      resources :comments, only: %i[create destroy]
      resources :article_likes, only: %i[create destroy]
    end

    resources :search, only: :index
  end
end
