Rails.application.routes.draw do
  devise_for :users

  as :user do
    get '/nurses/sign_up', :to => 'devise/registrations#new'
    get '/customers/sign_up', :to => 'devise/registrations#new'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  resources :dashboard, only: :index

  get 'terms-and-conditions' => 'terms_and_conditions#index', as: 'terms_and_conditions'
  get 'privacy-policy' => 'privacy_policy#index', as: 'privacy_policy'
  get 'faq' => 'faq#index', as: 'faq'
  get 'contact' => 'contact#index', as: 'contact'

  namespace :dashboard do
    get 'profile' => 'profile#show', as: 'profile'
    get 'profile/edit' => 'profile#edit', as: 'edit_profile'
    put 'profile/update' => 'profile#update', as: 'update_profile'
  end

  resources :services, only: [:new, :create] do
    get 'chose_assistent', to: 'services#chose_assistent', as: 'chose_assistent'
  end

  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  root 'home#index'
end
