Rails.application.routes.draw do
  devise_for :users

  as :user do
    get '/nurses/sign_up', :to => 'devise/registrations#new'
    get '/customers/sign_up', :to => 'devise/registrations#new'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  get 'terms-and-conditions' => 'terms_and_conditions#index', as: 'terms_and_conditions'
  get 'privacy-policy' => 'privacy_policy#index', as: 'privacy_policy'
  get 'faq' => 'faq#index', as: 'faq'
  get 'contact' => 'contact#index', as: 'contact'
end
