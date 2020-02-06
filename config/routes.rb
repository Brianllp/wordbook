Rails.application.routes.draw do
  devise_for :users
  root 'menu#index'
  get 'question/main'
  post 'question/main' => 'question#result'
  get 'question/result'
  get 'question/index'
  resources :question, only: %i(new create edit update destroy)
  # post 'question/result'
end
