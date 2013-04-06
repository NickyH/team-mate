TeamMate::Application.routes.draw do

  root :to => 'home#index'

  resources :teams do
    collection do
      get :select_team
    end
  end

  resources :competitions

  resources :games do
    collection do
      post :import
      post :result
      post :invite_player
    end
  end

  resources :users do
    collection do
      get :new_player
      post :create_new_player
    end
  end

  resources :users do
    collection do
      get 'txtform'
      post 'sendtxt'
    end
  end


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
