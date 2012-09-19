CRM::Application.routes.draw do
  get "welcome/index"

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  resources :users
  resources :sessions

  ActiveAdmin.routes(self)

  devise_for :users, ActiveAdmin::Devise.config

  root :to => 'admin/dashboard#index'
end
