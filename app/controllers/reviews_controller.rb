class ReviewsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @review = current_user.reviews.build(params[:review])
    if @review.save
      flash[:success] = "Review created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end

