Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'top#index'

    # application_controller
    get 'sign_out', to: 'application#sign_out'

    # top_controller
    get 'top', to: 'top#index'
    get 'top/sign_on', to: 'top#sign_on'
    post 'top/create', to: 'top#create'

    # account_controller
    get 'account/regist', to: 'account#regist'
    post 'account/create', to: 'account#create'
  
    # sessions_controller
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    # businesses_controller
    resources :businesses

    # clients_controller
    resources :clients

    # certifications_controller
    resources :certifications

    # letter_opener_web
    mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  end
end