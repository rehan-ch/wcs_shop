Rails.application.routes.draw do
  root "admin#index"
  namespace :admin do
    resources :mobiles do
    # get 'mobiles/index'
    # get 'mobiles/show'
    # get 'mobiles/new'
    # get 'mobiles/create'
    # get 'mobiles/edit'
    # get 'mobiles/update'
     get 'mobiles/sell', on: :member
   end
  end
  get 'admin/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
