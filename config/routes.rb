Masterit::Application.routes.draw do
 
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  root :to => "welcome#show"

  scope module: :web do
    root to: 'welcome#show'
  end

end
