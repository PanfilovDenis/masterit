Masterit::Application.routes.draw do

  resources :registration_works
  resources :nominates

  resources :competitions, only: [:create, :edit, :update, :index, :show, :destroy, :new] do
    collection do
      put :trigger_state_event
    end
  end
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  #root :to => "welcome#show"

  scope :module => :web do
    root :to => 'welcome#index'
  end

end
