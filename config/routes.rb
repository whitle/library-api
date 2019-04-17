# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :auth do
        post 'google', to: 'google#authenticate_user'
      end

      namespace :books do
        post 'not_assigned', to: 'books#not_assigned_books'
        post 'assign', to: 'books#assign_book'
      end
    end
  end
end
