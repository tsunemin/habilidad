Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'top#index'

    # top_controller
    get 'top', to: 'top#index'

    # businesses_controller
    resources :businesses

    # clients_controller
    resources :clients

    # certifications_controller
    resources :certifications
  end
end