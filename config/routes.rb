Rails.application.routes.draw do
  post 'postback', to: 'postbacks#create'
  get ':slug' => 'videos#show', as: :video
  root 'pages#index'
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'registrations' }
end
