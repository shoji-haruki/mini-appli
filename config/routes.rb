Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  # get 'messages/:id/edit' => 'messages#edit'
  # patch 'messages/:id' => 'messages', as: 'post'
  resources :messages, except: [:show]
end














# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
