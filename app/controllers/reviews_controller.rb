class ReviewsController < ApplicationController
  ERRORS = {
    not_logged_in: 'You must be logged in to add a review.',
    own_restaurant: 'You cannot review your own restaurant.'
  }

  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    restaurant = Restaurant.find_by_id(params[:restaurant_id])
    redirect_to '/', error: ERRORS[:not_logged_in] and return unless current_user

    redirect_to '/' and return unless restaurant

    existing_review = restaurant.reviews.find_by(user_id: current_user.id)
    redirect_to "/reviews/#{existing_review.id}", notice: 'You\'ve already posted a review!' and return if existing_review

    redirect_to '/', error: ERRORS[:own_restaurant] and return if current_user == restaurant.user

    @review = Review.new(restaurant_id: params[:restaurant_id])
  end

  # GET /reviews/1/edit
  def edit
    # p params
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if !!@review && current_user
        current_user.reviews << @review
        @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:description, :rating, :restaurant_id)
    end
end
