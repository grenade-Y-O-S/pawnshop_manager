Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'customers#index'

  Rails.application.routes.draw do
    resources :customers, only: [:index, :new, :create] do
      collection do
        get 'input'
        get 'search'
      end
    end

    resources :pawns, only: [:index, :new, :create] do
      collection do
        get 'result'
      end
    end

    resources :purchases, only: [:index, :new, :create] do
      collection do
        get 'result'
      end
    end

    resources :purchases, only: [:index]

  end
end
