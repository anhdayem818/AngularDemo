  Rails.application.routes.draw do
  
  get 'comments/create'

  root 'home#index'

  scope :api do
    get "/screencasts(.:format)" => "screencasts#index"
    get "/screencasts/:id(.:format)" => "screencasts#show"
    scope do
    	post "/screencasts/:id/comments(.:format)" => "comments#create"
    end
  end
end
