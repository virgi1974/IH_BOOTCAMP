Rails.application.routes.draw do
  root 'links#index'
  get '/links' => 'links#index'
  get '/:number' => 'links#show'

  post("/links", :to => "links#create")
  get '/links/most_visited_pages' => 'links#most_visited_pages'
  get '/links/visited_pages' => 'links#visited_pages'
end
