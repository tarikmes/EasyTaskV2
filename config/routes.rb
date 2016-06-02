Rails.application.routes.draw do

  get 'tasks/index'

namespace :admin do
resources :tasks do
  collection do
    get 'search','user_report', 'time_report','resource_report', 'task_resource_report', 'delayed_tasks_report'
  end
end
end



namespace :admin do
  resources :users, :task_statuses, :tasks, :resources
end


#namespace :admin do
#  resources :tasks do
#    get 'search', on: :collection
#  end
#end

#resources :tasks, :only => [:search] do


#namespace :admin do
 # resources :tasks do
  #end
#end

#resources :users do
#  resources :tasks
#end

#root 'admin/users#index'
root 'sessions#new'

resource :sessions, only: [:create] 

=begin
#resource :users do
#get "/home", :to => "users#get_user_tasks"
#end
=end

#resource :users

resources :users do
  resources :tasks do
  end
end

resources :tasks do
    resource :comments
end


#get '/login', to: 'sessions#new'
#get '/logout', to: 'sessions#destroy'

  get    '/login',         to: 'sessions#new'
  post   '/login',         to: 'sessions#create'
  get    '/logout',        to: 'sessions#destroy'
  get    '/registration',  to: 'users#new'



end
