Rails.application.routes.draw do
  devise_for :clients, skip: :registrations, controllers: { sessions: "sessions" }
  devise_scope :client do
    resource :registration,
      only: %w[new create edit update],
      path: 'clients',
      controller: 'registrations',
      as: :client_registration,
      path_names: {new: 'sign_up'}

    get 'clients/change_password', to: 'registrations#edit_password'
    put 'clients/change_password', to: 'registrations#update_password', as: :client_update_password
    get 'clients/confirmation', to: 'registrations#confirmation'
    post 'clients/confirmation', to: 'registrations#confirmation_action'
    post 'clients/resend_confirmation', to: 'registrations#resend_confirmation'

    get 'password/auth', to: 'password#auth'
    post 'password/auth', to: 'password#auth_action'
    get 'password/verify', to: 'password#verify'
    post 'password/verify', to: 'password#verify_action'
    get 'password/edit', to: 'password#edit'
    put 'password/update', to: 'password#update'
  end

  root to: 'pages#index'

  get 'cabinet',       to: 'clients#cabinet'
  get 'contacts',      to: 'pages#contacts'
  get 'about_us',      to: 'pages#about_us'
  get 'user_agreement',      to: 'pages#user_agreement'
  get 'privacy_policy',      to: 'pages#privacy_policy'
  get 'delivery',      to: 'pages#delivery'
  get 'security_info', to: 'pages#security_info'
  get 'payment_rules', to: 'pages#payment_rules'

  resources :services, only: [:index, :show]

  resources :cart, only: [:index, :show, :destroy] do
    post 'update_price', on: :member
  end

  resources :individual_items, only: [:new, :create] do
    get 'accept', on: :collection
    post 'update_price', on: :collection
    get 'calculate_price', on: :collection
    get 'send_to_cart', on: :collection
  end

  resources :details, only: [:index, :show, :destroy] do
    get 'search', on: :collection
    get 'filter', on: :collection
    post 'calculate_cost', on: :collection
    post 'add_to_cart', on: :collection
    get 'update_cart_count', on: :collection
  end

  resources :individual_orders, only: %w[new create show index] do
    get 'legal_entity', on: :collection
    get 'thx', on: :member
    get 'filter', on: :collection
    get 'search', on: :collection
  end

  scope :constructor, as: :constructor do
    get '/', to: 'constructor#show'
    post '/', to: 'constructor#create'
    get :info, to: 'constructor#info'
    get :attachment, to: 'constructor#attachment'
    post :upload, to: 'constructor#upload'
    get 'shape/:id', to: 'constructor#shape'
    put 'shape/:id', to: 'constructor#shape_update'
    get 'order_shape/:id', to: 'constructor#order_shape'
    post :save, to: 'constructor#save'
    post :cost, to: 'constructor#cost'
    get :select, to: 'constructor#select'
    post :add_to_cart, to: 'constructor#add_to_cart'
    put :send_drawing, to: 'constructor#send_drawing'
    delete :destroy_detail, to: 'constructor#destroy_detail'
  end

  namespace 'api' do
    namespace 'details' do
      post 'calculation_svg', action: :calculation_svg
    end
  end
end
