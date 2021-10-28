Rails.application.routes.draw do
  root to: 'customers#index'

  Rails.application.routes.draw do
    resources :customers, only: [:index, :new, :create, :edit, :update] do
      collection do
        get 'input'
        get 'search'
        get 'edit_result'
      end
    end

    resources :pawns, only: [:index, :new, :create, :update, :edit] do
      collection do
        get 'result'
        get 'status_input'
        get 'status_search'
        get 'status_edit'
        get 'status_result'
        get 'edit_result'
      end
    end

    resources :purchases, only: [:index, :new, :create, :edit, :update] do
      collection do
        get 'result'
      end
    end

    resources :interests, only: [:index, :new, :create, :edit, :update] do
      collection do
        get 'search'
        get 'result'
      end
    end

    resources :searchs, only: [:index] do
      collection do
        get 'input_customer'
        get 'result_customer'
        get 'input_pawn'
        get 'result_pawn'
        get 'input_purchase'
        get 'result_purchase'
        get 'input_interest'
        get 'result_interest'
      end
    end
  end
end
