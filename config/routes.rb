TeamMate::Application.routes.draw do

  root :to => 'home#index'

  resources :teams

  resources :competitions

  resources :games do
    collection do
      post :import
      post :invite_player
    end
  end

  resources :users do
    collection do
      get :new_player
    end
  end

  resources :users do
    collection do
      post 'sendtxt'
    end
  end


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
