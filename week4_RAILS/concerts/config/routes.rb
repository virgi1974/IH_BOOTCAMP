Rails.application.routes.draw do

# t.references :concert, index: true 

# rails g migration AddConcertToComments concert:references

  # root 'concerts#index'
  resources :concerts, only: [:index, :new, :create, :show] do
    resources :comments, only: [:index, :new, :create, :show]
  end

# concert_comments GET  /concerts/:concert_id/comments(.:format)     comments#index
# POST /concerts/:concert_id/comments(.:format)     comments#create
# new_concert_comment GET  /concerts/:concert_id/comments/new(.:format) comments#new
# concert_comment GET  /concerts/:concert_id/comments/:id(.:format) comments#show
# concerts GET  /concerts(.:format)                          concerts#index
# POST /concerts(.:format)                          concerts#create
# new_concert GET  /concerts/new(.:format)                      concerts#new
# concert GET  /concerts/:id(.:format)                      concerts#show

end
