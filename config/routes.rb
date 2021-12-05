# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  resources :users
  resources :sites

  namespace :advisor do
    resources :sites
  end
  post '/sitesdate/:id', to: 'sites#show'
end
