class PostsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:get_posts, :find_post,
                                                 :update_post]

  respond_to :json, :html

  def get_posts
  	response = Post.get_posts(params)

  	respond_with response
  end

  def find_post
    response = Post.find_post(params)

    respond_with response
  end

  def update_post
    response = Post.update_post(params, true)

    respond_with response
  end

  def post_params
    params.require(:post).permit(:name, :post_date, :user_id, :description)
  end

  private :post_params
end
