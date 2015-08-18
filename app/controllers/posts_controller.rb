class PostsController < ApplicationController

  respond_to :json, :html

  def post_params
    params.require(:post).permit(:name, :post_date, :user_id, :description)
  end

  private :post_params
end
