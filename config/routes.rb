Chess::Application.routes.draw do
  root to: 'Games#index'
  resources :games, :only => [:create, :destroy, :index, :show]
  resources :moves, :only => [:create, :destroy]
end
