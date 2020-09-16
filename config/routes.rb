Rails.application.routes.draw do
  resources :menus do
    resources :ingredients
  end
end
