Rails.application.routes.draw do

    get "/" => "users#home"
    get "/home" => "users#home"

    devise_for :users, :controllers => {:registrations => "registrations"}
    resources :users, :only => [:index, :show, :edit, :update] do
        resources :messages
    end
    resources :photos
    resources :languages
    resources :neighborhoods

    # resources :interests
    # resources :places
    #
    # get "/search_local_places" => "users#search_local_places"
    # get "/show_local_places" => "users#show_local_places"

end
