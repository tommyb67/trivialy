Trivialy::Application.routes.draw do
  resources :users
  resources :games do
    resources :questions
  end

  resource :session, only: [:new, :create, :destroy]
end
