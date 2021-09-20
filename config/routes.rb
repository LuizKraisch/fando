Rails.application.routes.draw do 
  get '/', to: redirect('/tasks')
  get '/tasks', to: 'tasks#index'

  resources :tasks do
    collection do
      get :trash_can
      delete :destroy_all
    end

    member do
      patch :restore
      delete :really_destroy
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
