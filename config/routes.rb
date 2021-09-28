Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'customers#index'

  Rails.application.routes.draw do
    resources :customers, only: [:index, :new, :create]
#    collection do
#      get 'select'
#    end
    resources :pawns, only: [:index]
  end

end
