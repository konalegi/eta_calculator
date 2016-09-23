Rails.application.routes.draw do
  namespace :v1 do
    resources :cars do
      collection do
        get :eta
      end
    end
  end
end
