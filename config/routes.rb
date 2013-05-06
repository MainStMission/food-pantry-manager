# -*- encoding : utf-8 -*-
FoodPantry::Application.routes.draw do


  resources :donations

  resources :donors

  #resources :neighbors

  resources :households do
    resources :visits
    resources :neighbors
  end

  #resources :visits

  resources :volunteers do
    member do
      get :sign_in
      get :sign_out
    end
  end
 devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}


  match 'time_clock' => 'time_clock#show'

  authenticated :user do
    root :to => "users#index"
  end


  root :to => redirect("/users/sign_in")


  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  scope "/admin" do
    resources :users
  end

end
