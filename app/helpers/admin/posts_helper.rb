module Admin::PostsHelper
  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :body, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
