Rails.application.routes.draw do
  resources :resources do
      resources :messages, only: [:new, :create]
  end
  scope "(:locale)", locale: /en|ar|ta|es|fa/ do
    devise_for :users
    root to: 'pages#home'

    resources :resources do
      resources :favourites, only: [:index, :create]
    end
    resources :dashboard, only: [:index, :create]
    resources :favourites, only: [:destroy]

    resources :users, only: [:show] do
    end
  end
  patch "/messages/:id/review", to: "messages#review", as: 'messages_review'
  patch "/messages/:id/destroy", to: "messages#destroy", as: 'messages_destroy'

   patch "/resources/:id/approve", to: "resources#approve", as: 'resources_approve'
   patch "/resources/:id/decline", to: "resources#decline", as: 'resources_decline'
   patch "/resources/:id/destroy", to: "resources#destroy", as: 'resources_destroy'
end
