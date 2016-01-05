Rails.application.routes.draw do
  root 'products#list'
  get "/products" => "products#list"
  resources :users, only: [:index, :show, :create, :new, :destroy] do
    resources :products, only: [:index, :new, :show, :create, :destroy] do 
      resources :bids, only: [:new,:create]
    end
  end
end

# root GET    /                                                       products#list
#             products GET    /products(.:format)                                     products#list
#    user_product_bids POST   /users/:user_id/products/:product_id/bids(.:format)     bids#create
# new_user_product_bid GET    /users/:user_id/products/:product_id/bids/new(.:format) bids#new
#        user_products GET    /users/:user_id/products(.:format)                      products#index
#                      POST   /users/:user_id/products(.:format)                      products#create
#     new_user_product GET    /users/:user_id/products/new(.:format)                  products#new
#         user_product GET    /users/:user_id/products/:id(.:format)                  products#show
#                      DELETE /users/:user_id/products/:id(.:format)                  products#destroy
#                users GET    /users(.:format)                                        users#index
#                      POST   /users(.:format)                                        users#create
#             new_user GET    /users/new(.:format)                                    users#new
#                 user GET    /users/:id(.:format)                                    users#show
#                      DELETE /users/:id(.:format)                                    users#destroy
