Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope module: :todo_domain do
    resources :todos
  end

  scope module: :user_domain do
    post 'sign_in' => 'users#sign_in'
  end
end
