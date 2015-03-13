Popupxnyc::Application.routes.draw do

  root 'blogs#index'

  resources :users
  resources :artworks

  get 'contact' => 'contact#index'
  get 'admin' => 'admin#index'
  get 'instagram' => 'static#instagram'

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
