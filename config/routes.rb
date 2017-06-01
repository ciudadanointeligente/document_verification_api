Rails.application.routes.draw do
  get 'validation/validate'

  post 'authenticate', to: 'authentication#authenticate'
  post 'validate', to: 'validation#validate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
authentication
