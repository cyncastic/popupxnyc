Popupxnyc::Application.routes.draw do

  root 'static#home'

  resources :users
  resources :artworks

  get 'contact' => 'contact#index'
  get 'test' => 'static#test'
  get 'admin' => 'admin#index'

  resources :blogs, :users, :media

  resources :artworks,:categories do
    collection do
      post :sort
    end
  end

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  
end
