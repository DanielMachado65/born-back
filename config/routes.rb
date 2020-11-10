Rails.application.routes.draw do
  # Api definition
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories
      resources :products, expect: :index

      # order
      resources :order_statuses, only: %I[index show create]
      resources :orders, expect: :index do
        resources :order_lines, only: %I[create destroy]
      end
    end
  end
end
