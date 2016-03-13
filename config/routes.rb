Rails.application.routes.draw do

  root 'login#login'
  resources :competicao
  #match 'sign-up' => 'sign_up#new', :as => 'sign-up', :via => 'GET'

end
