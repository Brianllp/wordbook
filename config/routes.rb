Rails.application.routes.draw do
  devise_for :users
  root 'menu#index'
  get 'question/main'
end
