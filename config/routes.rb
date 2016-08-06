Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  scope 'posts' do
  	post '/new' => 'posts#new', as: "new_post"
  	get '/:id/edit' => 'posts#edit', as: "edit_post"
  	put '/:id/update' => 'posts#update', as: "update_post"
  end
end
