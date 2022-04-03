Rails.application.routes.draw do
  resources :notes do 
      delete 'destroy_all', on: :collection
      put 'multiple_new', on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
