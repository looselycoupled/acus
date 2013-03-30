Shortline::Application.routes.draw do

  get "root/home"
  root :to => 'root#home'
  
  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

end
