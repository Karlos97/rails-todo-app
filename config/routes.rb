Rails.application.routes.draw do
  resources :notes do 
      delete 'destroy_all', on: :collection
      put 'multiple_new', on: :collection
  end

  get '' => redirect('/notes')
end
