class SongsController < ApplicationController
  def index
    if params[:artist_id]#if we are accessing all songs via artist routing
      #we want @songs = artist.songs (Accessed via songs routing: .artist_id vs artist.id)
      if @artist = Artist.find_by(id: :artist_id) && @artist != nil 
        @songs = Artist.find_by(params[:artist_id]).songs 
      else 
        flash[:message] = "Artist not found"
        redirect_to artists_path 
      end 
    else 
      @songs = Song.all
    end 
  end

  def show
    @song = Song.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Wrong song id"
    redirect_to artist_songs_path
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name)
  end
end

