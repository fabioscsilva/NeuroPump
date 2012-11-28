NeuroPump::Application.routes.draw do
  resources :logins

  resources :types

  resources :clinical_histories

  resources :patients

  resources :secretaries

  resources :neuropsychologists

  resources :managers

  resources :payments

  resources :clinics

  resources :genders

  resources :sessions

  resources :civil_statuses

  resources :administrators

  resources :handednesses

 resources :visitors


end
