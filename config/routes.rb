Rails.application.routes.draw do

    get "/" => "users#home"
    get "/home" => "users#home"

    devise_for :users, :controllers => {:registrations => "registrations"}
    resources :users do
        resources :messages
    end
    resources :photos
    resources :languages
    resources :neighborhoods
    resources :hobbies

    get "/search_local_places" => "users#search_local_places"
    get "/show_local_places" => "users#show_local_places"
    get "/get_places_data" => "users#get_places_data"
    get "/local_places_json" => "users#local_places_json"

    get "/filter_messages" => "messages#filter_messages"
    get "/my_messages/:id" => "messages#my_messages"

end
