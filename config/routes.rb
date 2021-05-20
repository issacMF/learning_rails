Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names:{
    sign_in: "signin",
    sign_out: "signout",
    password: "secret",
    confirmation: "verification",
    registration: "register",
    sign_up: "signup"
  }, controllers: {
    sessions: "sessions",
    registrations: "registers"
  }

  root "pages#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
