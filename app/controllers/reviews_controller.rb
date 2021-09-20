class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @review = Review.new(review_params)
    @shop = Shop.find(params[:shop_id])
    @review.shop = @shop
    @review.user = current_user
    if @review.save
      redirect_to results_path(query: @shop.name)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
