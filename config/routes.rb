Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post '/registerBooks', to: 'books#create'
      get '/mybooks', to: 'books#index'
      get '/mybooks/:id', to: 'books#show'
      delete '/mybooks/:id', to: 'books#destroy'

      post '/users', to: 'users#create'

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/checkLogin', to: 'sessions#check'
    end
  end
end
