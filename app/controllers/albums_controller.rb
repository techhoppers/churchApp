class AlbumsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  layout "admin", :except => [:index, :show]

  def index
    @albums = Album.all
  end

  def list
    @albums = Album.all
  end
  
  def new
    @album = current_user.albums.new
  end

  def create
    params.permit!
    @album = current_user.albums.build(params[:album])
    if @album.save
      # to handle multiple images upload on create
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(:image => image)
        }
      end
      flash[:success] = "Your album has been created."
      redirect_to list_albums_path
    else
      flash[:error] = "Something went wrong."
      render :new
    end
  end
  def update
    if @album.update(params[:album].permit(:title,:description))
      # to handle multiple images upload on update when user add more picture
      if params[:images]
        params[:images].each { |image|
          @album.photos.create(:image => image)
        }
      end
      flash[:error] = "Album has been updated."
      redirect_to list_albums_path
    else
      render :edit
    end
  end

  def show
    @album = Album.find(params[:id])
    @photos = @album.photos unless @album.blank?
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to list_albums_path
  end
end
