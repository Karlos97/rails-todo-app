Rails.application.routes.draw do
  resources :notes do 
    collection do 
      delete 'destroy_all'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
