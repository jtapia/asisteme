Rails.application.routes.draw do
  devise_for :users

  as :user do
    get '/nurses/sign_up', :to => 'devise/registrations#new'
    get '/customers/sign_up', :to => 'devise/registrations#new'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
end
