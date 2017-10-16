Rails.application.routes.draw do
	root to: 'reports#index'
  resources :reports, only: [:index, :show] do
  	resource :download, only: [:show]
	end
end
