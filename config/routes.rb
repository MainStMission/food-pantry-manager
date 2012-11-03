# -*- encoding : utf-8 -*-
FoodPantry::Application.routes.draw do
  resources :donations

  resources :donors

  resources :neighbors

  resources :volunteers do
    member do
      get :sign_in
      get :sign_out
    end
  end

  devise_for :users
  scope "/admin" do
    resources :users
  end
  match 'time_clock' => 'time_clock#show'

  authenticated :user do
    root :to => "users#index"
  end

  root :to => "users#sign_in"
end
