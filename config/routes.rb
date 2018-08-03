Rails.application.routes.draw do
  # add route for all songs from an artist. EG: Nest resource
  resources :artists do
    resources :songs, only: [:index]
  end

  resources :songs

end
