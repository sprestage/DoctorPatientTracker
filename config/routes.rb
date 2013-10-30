DoctorPatientTracker::Application.routes.draw do
  resources :patients
  resources :doctors

  root :to => 'home#index'
end
