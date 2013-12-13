class ArtworksController < ApplicationController
  skip_before_filter :authorize, only: [:show]
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  def index
    if !params[:category_id]
      @artworks = Artwork.order("position")
    else
      @artworks = Category.find(params[:category_id]).artworks.order("position")
    end
    @categories = Category.order("position")
  end

  def show
  end

  def new
    @artwork = Artwork.new
  end

  def edit
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      if params[:artwork][:image]
        render :crop
      else
        redirect_to artworks_path, notice: 'Artwork successfully created.'
      end
    else
      render :new
    end
  end

  def update
    if @artwork.update(artwork_params)
      redirect_to artworks_path, notice: 'Artwork successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @artwork.destroy
    redirect_to artworks_path, notice: 'Artwork successfully destroyed.'
  end

  def sort
    params[:artwork].each_with_index do |id, index|
      Artwork.where(id: id).update_all(position: index+1)
    end
    render nothing: true
  end

  private
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    def artwork_params
      params.require(:artwork).permit(:title, :category_id, :position, :sold, :image, :year, :length, :width, :medium, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
