Rails.application.routes.draw do
  # add routes for all songs from an artist AND route for single song from artist.
  resources :artists do
    resources :songs, only: [:index, :show]
  end

  resources :songs

end
