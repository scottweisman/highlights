Highlights::Application.routes.draw do
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

   resources :sessions

   root :to => 'sessions#new'

   get 'books', to: 'books#index', as: 'books'
   get 'books/:asin', to: 'books#show', as: 'book'
   get 'books/test', to: 'books#test'
end
