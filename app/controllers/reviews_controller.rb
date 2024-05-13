class ReviewsController < ApplicationController
  def create
    # create a new review with the params from the form
    @review = Review.new(review_params)
    # find the restaurant with the id from the URL
    @restaurant = Restaurant.find(params[:restaurant_id])
    # associate the review with the restaurant
    @review.restaurant = @restaurant
    # if the review is saved, redirect to the restaurant page
    # otherwise, re-render the form
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render "restaurants/show", status: :unprocessable_entity
    end
  end

  private 

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
