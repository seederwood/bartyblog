class CommentsController < ApplicationController
  include CommentsHelper

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)

    flash[:notice] = 'Comment added successufully'
    redirect_to post_path(@post)
  end
end
