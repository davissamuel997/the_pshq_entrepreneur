class PostsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:get_posts, :find_post,
                                                 :update_post, :create_post_comment]

  respond_to :json, :html

  def get_posts
  	response = Post.get_posts(params)

    if current_user.present?
      response["current_user"] = current_user
    end

  	respond_with response
  end

  def find_post
    response = Post.find_post(params)

    if current_user.present?
      response["current_user"] = current_user
    end

    respond_with response
  end

  def update_post
    response = Post.update_post(params, true)

    respond_with response
  end

  def create_post_comment
    params["user_id"] = current_user.id

    response = Post.create_post_comment(params)

    respond_with response
  end

  def post_params
    params.require(:post).permit(:name, :post_date, :user_id, :description)
  end

  private :post_params
end
