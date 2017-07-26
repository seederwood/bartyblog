module CommentsHelper
  def comment_params
    params.require(:comment).permit(:name, :email, :post_id, :body)
  end
end
