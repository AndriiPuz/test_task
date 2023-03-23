Rails.application.routes.draw do
  root "payloads#index"
  get 'search', to: 'payloads#search'


end
