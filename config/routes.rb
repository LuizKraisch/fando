Rails.application.routes.draw do 
  get '/', to: redirect('/tasks')
  get '/tasks', to: 'tasks#index'

  resources :tasks do
    collection do
      get :trash_can
      get :destroy_all
    end

    member do
      get :restore
      get :really_destroy
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
