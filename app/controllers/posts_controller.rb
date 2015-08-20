class PostsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:get_posts]

  respond_to :json, :html

  def get_posts
  	response = Post.get_posts(params)

  	respond_with response
  end

  def post_params
    params.require(:post).permit(:name, :post_date, :user_id, :description)
  end

  private :post_params
end
