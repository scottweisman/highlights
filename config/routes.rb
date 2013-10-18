Highlights::Application.routes.draw do
	get 'signin', to: 'sessions#new', as: 'signin'
	post 'signin', to: 'sessions#create', as: 'sessions'
	get 'signout', to: 'sessions#destroy', as: 'signout'

	get 'books', to: 'books#index', as: 'books'
	get 'books/:asin', to: 'books#show', as: 'book'
	get 'books/test', to: 'books#test'

   root :to => 'books#index'
end
