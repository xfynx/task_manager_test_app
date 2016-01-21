Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :tasks do
    member do
      get 'download_file/:filename', to: 'tasks#download_file'
      post 'pick_up', to: 'tasks#pick_up'
      post 'start_task', to: 'tasks#start_task'
      post 'finish_task', to: 'tasks#finish_task'
    end
  end

  devise_for :users

  root 'cabinet#index'
  get 'user/:id', to: 'cabinet#show'
end
