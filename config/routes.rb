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


    get "/filter_messages" => "messages#filter_messages"
    get "/my_messages/:id" => "messages#my_messages"

end
