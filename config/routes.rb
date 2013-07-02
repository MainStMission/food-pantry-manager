# -*- encoding : utf-8 -*-
FoodPantry::Application.routes.draw do

  #devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :donations, :donors, :visits, :neighbors


  resources :households do
    resources :visits
    resources :neighbors
  end

  resources :visits do
      get :harvest
    end


  #resources :visits

  resources :volunteers do
    member do
      get :sign_in
      get :sign_out
    end
  end
 devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}


match 'print' => 'households#print', :via => :get

  match 'new_visit' => 'households#new_visit', :via => :get

  match 'time_clock' => 'time_clock#show'

  match '/harvest' => 'visits#harvest', via: :get

  authenticated :user do
    root :to => "users#index"
  end


  root :to => redirect("/users/sign_in")

  #match 'new_user' :to => 'new_user_session'

post '/household_end_point' => 'households#submit'


  devise_for :admin_users
  #
    resources :users

end
