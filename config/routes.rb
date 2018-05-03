Rails.application.routes.draw do
  root 'broken_links#index'

  post 'broken_links/go' => 'broken_links#go'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
