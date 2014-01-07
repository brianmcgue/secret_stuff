SecretShareAjax::Application.routes.draw do
  resources :users, :only => [:create, :new, :show, :index] do
    resources :secrets, :only => :new
    resources :friendships, :only => :create
  end
  resources :secrets, :only => :create
  resource :session, :only => [:create, :destroy, :new]
  resources :friendships, :only => :destroy

  root :to => "users#show"
end
