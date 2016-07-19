Rails.application.routes.draw do
  root to: 'students#index'

  resources :students
  resources :courses
  resources :class_rooms, except: :destroy
end
