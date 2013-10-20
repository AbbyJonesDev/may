class SongsController < ApplicationController


# ensure admin for other actions
  before_filter :check_admin_logged_in!, :except => [:show, :index]


  def new
    @song = Song.new
  end


  def create
    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "#{@song.title} was successfully created."
      redirect_to @song
    else
      flash[:warning] = @song.errors.full_messages
      render action: 'new'
    end
  end

  def edit
    @song = Song.find params[:id]
  end

  def update
    @song = Song.find params[:id]
    if @song.update(song_params)
      flash[:notice] = "#{@song.title} was successfully updated"
      redirect_to songs_path(@song)
    else
      flash[:warning] = @song.errors.full_messages
      render action: 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song '#{@song.title}' deleted."
    redirect_to songs_path
  end

  def index
    @songs = Song.all
  end

  def show
    id = params[:id]
    @song = Song.find(id)
  end

  private
    def check_admin_logged_in! # if admin is not logged in, user must be logged in as admin
      if !current_user.try(:admin?)
        flash[:notice] = "You must be an administrator to perform this function."
        return redirect_to songs_path
      end   
    end
    
    def check_user_logged_in! # User must be logged in
      if !user_signed_in?
        authenticate_user!
      end
    end

    def song_params
      params.require(:song).permit(:title, :description, :keywords, :scripture, :CCLI, :copyright, :mp3, :chord_chart)
    end

end
