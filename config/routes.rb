Rails.application.routes.draw do

  root 'login#login'
  resources :competicaos
  #match 'sign-up' => 'sign_up#new', :as => 'sign-up', :via => 'GET'

end
