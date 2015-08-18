class CommentsController < ApplicationController

  respond_to :json, :html

  def comment_params
    params.require(:comment).permit(:post_date, :user_id, :description, :approved)
  end

  private :comment_params
end
