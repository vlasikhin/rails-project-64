Rails.application.routes.draw do
  resources :posts do
    resources :comments, only: [:create]
  end

  devise_for :users
  devise_scope :user do
    get 'users/sign_out' => "devise/sessions#destroy"
  end

  root "posts#index"
end
