YTZ::Application.routes.draw do
  root 'utz#index'

  resources :matching_utz
end
