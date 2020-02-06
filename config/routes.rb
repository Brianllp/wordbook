Rails.application.routes.draw do
  devise_for :users
  root 'menu#index'
  get 'question/main'
  post 'question/main' => 'question#result'
  get 'question/result'
  # post 'question/result'
end
