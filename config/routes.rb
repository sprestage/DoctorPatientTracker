DoctorPatientTracker::Application.routes.draw do
  resources :appointments


  resources :patients
  resources :doctors

  root :to => 'home#index'
end
