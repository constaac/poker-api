# frozen_string_literal: true
Rails.application.routes.draw do
  resources :players, only: [:index, :destroy]
  resources :examples, except: [:new, :edit]
  post '/sign-up' => 'users#signup'
  patch '/players/save' => 'players#update'
  patch '/player' => 'players#show'
  post '/players/create' => 'players#create'
  post '/sign-in' => 'users#signin'
  delete '/sign-out/:id' => 'users#signout'
  patch '/change-password/:id' => 'users#changepw'
  # resources :users, only: [:index, :show]
end
