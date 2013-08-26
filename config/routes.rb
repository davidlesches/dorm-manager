DormManager::Application.routes.draw do

  resources :sessions
  resources :attendances do
    get :reset, on: :member
  end

  match '/login' => 'sessions#new', as: :login
  match '/logout' => 'sessions#destroy', as: :logout

  namespace :admin do

    resources :sessions, :administrators, :counselors, :rooms, :students

    match '/login' => 'sessions#new', as: :login
    match '/logout' => 'sessions#destroy', as: :logout

    root :to => 'counselors#index'

  end

  root :to => 'reports#show'

end
