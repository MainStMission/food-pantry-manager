# -*- encoding : utf-8 -*-
FoodPantry::Application.routes.draw do

  resources :foodlines


  resources :foods


  resources :missions


  #devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :donations, :donors, :visits, :neighbors, :missions


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


  get  'print' => 'households#print'

  get 'new_visit' => 'households#new_visit'

  get 'time_clock' => 'time_clock#show'

  get '/harvest' => 'visits#harvest'



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
