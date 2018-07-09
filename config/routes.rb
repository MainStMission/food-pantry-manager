# -*- encoding : utf-8 -*-
FoodPantry::Application.routes.draw do





  #devise_for :admin
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  resources :foodlines, :visits, :donations, :donors, 
            :neighbors, :volunteers, :foods, :missions, :tokens

resources :donations do
  resources :donors
end


  resources :households do
    resources :visits
    resources :neighbors
    resources :tokens
    collection do
      get :token_index
      get :visit_index
    end
  end

  resources :tokens do
    resources :visits
  end


  resources :visits do
      get :harvest
      resources :foodlines
      get :verify
    end

  resources :foods do
    resources :foodlines
  end
    



  resources :volunteers do
    member do
      get :sign_in
      get :sign_out
    end
  end
 devise_for :users, :controllers => {:registrations => "users/registrations", :passwords => "users/passwords"}


  get  'print' => 'households#print'

  get 'new_visit' => 'households#new_visit'

  # get 'household_token_index' => 'households#token_index'

  get 'time_clock' => 'time_clock#show'

  get '/harvest' => 'visits#harvest'

  get '/open_visit' => 'visits#open_visit'




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
