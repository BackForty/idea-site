IdeaSite::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :events do
    resources :ideas do
      resources :comments, :only => [:create]

      member do
        post '/vote/:vote' => :vote
      end

      collection do
        get '/similar/(:title)' => :similar, :as => :similar
        get '/search' => :search, :as => :search
      end
    end
  end

  match '/past_events' => 'events#index', :defaults => {:past => true}

  controller :pages do
    get '/apis' => :apis, :as => :apis
    get '/schedule' => :schedule, :as => :schedule
    get '/sponsor' => :sponsor, :as => :sponsor
  end

  controller :contact do
    get '/contact' => :new, :as => :contacts
    post '/contact' => :create, :as => :contacts
  end

  controller :newsletter do
    post '/subscribe' => :subscribe, :as => :subscriptions
  end

  root :to => 'events#index'
end
