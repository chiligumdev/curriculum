Rails.application.routes.draw do
	root 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'registrations' }
end
