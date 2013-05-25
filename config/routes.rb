Shortline::Application.routes.draw do

  get "pages/show"

  get "resources", :to => 'resources#index'

  mount Ckeditor::Engine => '/ckeditor'

  get "root/home"
  root :to => 'root#home'
  
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # catch all route for dynamic pages 
  get '*id', to: 'pages#show', :as => :page

end
