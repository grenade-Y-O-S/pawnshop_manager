Rails.application.routes.draw do
  root to: 'customers#index'

  Rails.application.routes.draw do
    resources :customers, only: [:index, :new, :create] do
      collection do
        get 'input'
        get 'search'
      end
    end

    resources :pawns, only: [:index, :new, :create, :update] do
      collection do
        get 'result'
        get 'status_input'
        get 'status_search'
        get 'status_edit'
        get 'status_result'
      end
    end

    resources :purchases, only: [:index, :new, :create] do
      collection do
        get 'result'
      end
    end

    resources :interests, only: [:index, :new, :create] do
      collection do
        get 'search'
        get 'result'
      end
    end
  end
end
