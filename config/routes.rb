Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'my_portofolio', to: 'users#my_portofolio'
  get 'search_stock', to: 'stocks#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
