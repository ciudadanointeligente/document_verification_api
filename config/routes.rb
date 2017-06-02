Rails.application.routes.draw do
  get 'validation/validate'

  post 'authenticate', to: 'authentication#authenticate'
  post 'validate', to: 'validation#validate'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

# curl -H "Authorization: eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE0OTY0MTIzNzd9.pQgPNV_rZd0osk1N4Fvp0NkP1HhE5sHZi5iJXDD4S5A; Content-Type: application/json" -X POST -d '{"rut" : "a"}' http://localhost:3000/validate
