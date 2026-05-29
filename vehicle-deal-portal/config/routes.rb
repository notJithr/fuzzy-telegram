Rails.application.routes.draw do
  resources :deals
  get "deal_summary", to: "reports#deal_summary"
  root "deals#index"
end
