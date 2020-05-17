Rails.application.routes.draw do
  root to: 'surveys#index'
  resources :surveys do
    resources :questions
  end

  namespace :admin do
    resources :surveys do
      resources :questions
    end
  end

end
