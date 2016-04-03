Rails.application.routes.draw do

  devise_for :users
  resources  :items do 
  	member do
  	  patch :complete # The verb patch is for delet. this refer to the complete method in the item_controller.
  	end
  end
  root             'items#index'
  get 'home', to:  'pages#home'
end



