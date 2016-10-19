class ListingsController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :create, :index]

  # GET /listings
  def index
    @category = Category.find(params[:category_id])
    @listings = @category.listings.all
  end

  # GET /listings/1
  def show
  end

  # GET /listings/new
  def new
    @category = Category.find(params[:category_id])
    @listing = @category.listings.build
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  def create
    @listing = @category.listings.new(listing_params)

    if @listing.save
      redirect_to category_listings_path, notice: 'Listing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listings/1
  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
    redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:title, :category_id)
    end
end
