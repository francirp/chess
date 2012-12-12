Chess::Application.routes.draw do
  root to: 'Games#index'
  resources :games, :except => [:edit, :update]
  resources :moves, :only => [:create, :destroy]
end
