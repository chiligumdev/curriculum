Rails.application.routes.draw do
	get ':slug' => 'videos#show', as: :video
	root 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'registrations' }
end
