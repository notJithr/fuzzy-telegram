Rails.application.routes.draw do
  resources :deals
  root "deals#index"
end
