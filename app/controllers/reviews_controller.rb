class ReviewsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  before_filter :authorized_user, :only => :destroy

  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Review created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @review.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @review = Review.find(params[:id])
      redirect_to root_path unless current_user?(@review.user)
    end
end

